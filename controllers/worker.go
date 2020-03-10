// Программа мониторинг доступности сервисов
package controllers

import (
	"encoding/json"
	"fmt"
	"golang.org/x/net/context"
	"log"
	"net/http"
	"os"
//	"strconv"
	"reflect"
	"sort"
	"sync"
	"time"
	m "github.com/pprisn/test_scrapper/models"
//	u "github.com/pprisn/test_scrapper/utils"
)


func jsElement(port string) string {
	if "80" == port {
		return "\"Status\": \""
	} else if "443" == port {
		return "\"Status443\": \""
	}
	return "0"
}

//структура для хранения результатов
type words struct {
	sync.Mutex //добавить в структуру мьютекс
	found      map[int]string
}

//Инициализация области памяти
func newWords() *words {
	return &words{found: map[int]string{}}
}

//Фиксируем вхождение слова
func (w *words) add(word int, WS string) {
	w.Lock()         //Заблокировать объект
	defer w.Unlock() // По завершению, разблокировать
	WorkStatus, ok := w.found[word]
	if !ok { //т.е. если ID запроса не найдено заводим новый элемент слайса
		w.found[word] = WS
		return
	}
	// слово найдено в очередной раз , увеличим счетчик у элемента слайса
	w.found[word] = WorkStatus + "," + WS
}

//var (
//	wg sync.WaitGroup
//)

var Worker = func() {
	var wg2 sync.WaitGroup

	//Создание структуры хранения результатов
	w := newWords()
	//	var err error

	floger, err := os.OpenFile("scrapper_work.log", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
			panic(err)
	}
	defer floger.Close()
	log.SetOutput(floger)
	t0 := time.Now()
	log.Printf("СТАРТ %v \n", t0)

	ports := [2]string{"80", "443"}
//	ports := [1]string{"80"}

	var id int
	var name string
		// Получить выборку
		urls := m.GetUrls()
	//	rows, err := &m.db.Raw("select id, name from urls").Rows()
//		defer rows.Close()
//		if err != nil {
//			return
//		}
		i := 0
		for _, rows:=range urls { //rows.Next() {
			i = i + 1
			//rows.Scan(&id, &name)
                        id   = int(rows.ID)
                        name = rows.Name 

			//		idstr = strconv.Itoa(id)
			fmt.Printf("Scan rows id= %d  , name = %s \n", id, name)
			for _, port := range ports {
				wg2.Add(1) //!required
				go func(id int, name string, port string) {
					defer wg2.Done() //!required
					// Создание контекста с ограничением времени его жизни в 5 сек
					ctx, cancel := context.WithTimeout(context.Background(), 50*time.Second)
					defer cancel()
					wg2.Add(1) //!required
					go checkStatus(ctx, id, name, port, w, &wg2)
					time.Sleep(8000 * time.Millisecond) //!reuired more then timeout
				}(id, name, port)

			}
		}
	wg2.Wait() //!required

	// To store the keys in slice in sorted order
	var keys []int
	for k, _ := range w.found {
		keys = append(keys, k)
	}
	sort.Ints(keys)

         var tm, stm string
	// To perform the opertion you want
	for _, k := range keys {
		fmt.Println("Key:", k, "Value:", w.found[k])
		var dat map[string]interface{}
		err := json.Unmarshal([]byte("{ "+w.found[k]+" }"), &dat)
              
		if err != nil {
			log.Printf("ErrorUnmarshal id = %d \t%s\n", k, "{ " + w.found[k] + " }")
			continue
		} else {
                        //tm , err := strconv.Atoi(dat["Status"].(string))
                        tm  = dat["Status"].(string)
                        stm = dat["Status443"].(string)
//			if err != nil {
//			   tm  = -2
//			}
			//m.db.Exec("UPDATE urls SET updated_at=NOW(), timeout=? WHERE id = ?",tm, k)
			m.UpdateTimeout(uint(k), tm, stm )
			//!fmt.Printf("OK   Unmarshal id = %d \t%s\n", k, "{ " + w.found[k] + " }")
		}
	}
	t1 := time.Now()
	log.Printf("СТОП. Время выполнения %v сек.\n", t1.Sub(t0))
	clear(&w)

}

func checkStatus(ctx context.Context, id int, ip string, port string, dict *words, wg2 *sync.WaitGroup) error {
	defer wg2.Done() //!required
        t0 := time.Now()
	//Формируем структуру заголовков запроса ожидаем отклик до 4 сек
	tr := &http.Transport{}
	client := &http.Client{Transport: tr, Timeout: time.Duration(60 * time.Second)}
	//client := &http.Client{Transport: tr}
	// канал для распаковки данных anonymous struct to pack and unpack data in the channel
	c := make(chan struct {
		r   *http.Response
		err error
	}, 1)
	defer close(c)
	req, _ := http.NewRequest("GET", "http://"+ip+":"+port, nil)
	req.WithContext(ctx)
	vStatus := ""
	wg2.Add(1) //!required
	go func() {
		defer wg2.Done() //!required
		resp, err := client.Do(req)
		//fmt.Printf("Doing http request, %s \n", id)
		//пишем в канал данные ответа сервера или ошибку
		pack := struct {
			r   *http.Response
			err error
		}{resp, err}
		c <- pack
	}()
	// Кто первый того и тапки...
	select {
	case <-ctx.Done():
		tr.CancelRequest(req)
		<-c // Wait for client.Do
		//fmt.Printf("Cancel context, НЕ ДОЖДАЛИСЬ ОТВЕТА СЕРВЕРА на запрос %s\n", id)
		//Добавим результат выполнения запроса со статусом CancelContext
		//key := id + ";" + port
		//vStatus = jsElement(port) + "Error cancel context" + ":" + port + "\""
        	//t1 := time.Now()
                //d2, _ :=  time.ParseDuration(fmt.Sprintf("%v",t1.Sub(t0)))
                //vStatus = jsElement(port) +fmt.Sprintf("%.0f",d2.Seconds()) + "\""
                vStatus = jsElement(port) +"60" + "\""
	//	m, _ := time.ParseDuration("1m30s")
	//	fmt.Printf("Take off in t-%.0f seconds.", m.Seconds())
		dict.add(id, vStatus)
		//dict.add(id, sStatus)
		return ctx.Err()
	case ok := <-c:
		err := ok.err
//		resp_ := ok.r
		if err != nil {
			//vStatus = jsElement(port) + "Error response" + ":" + port + "\""
                         vStatus =  jsElement(port)+"-1"+ "\""
//                        sStatus =  "\"StrStatus\": \"" +"-1"+ "\""
		} else {
                t1 := time.Now()
//                d     :=  fmt.Sprintf("%d",t1.Sub(t0))
                d2, _ :=  time.ParseDuration(fmt.Sprintf("%v",t1.Sub(t0)))
     //           vStatus = jsElement(port) + d + "\""
                vStatus = jsElement(port) +fmt.Sprintf("%.0f",d2.Seconds()) + "\""
		}
		//Добавим результат выполнения запроса Ответ сервера
		dict.add(id, vStatus)
//		dict.add(id, sStatus)
//		if *plog == "full" {
//			log.Printf("%d\t%s:%s\t%s\n", id, ip, port, vStatus)
//		}
		//!		fmt.Printf("Server Response ID=%d port=%s Status=%s\n", id, port, vStatus)
	} //select
	return nil
}

func clear(v interface{}) {
	p := reflect.ValueOf(v).Elem()
	p.Set(reflect.Zero(p.Type()))
}
