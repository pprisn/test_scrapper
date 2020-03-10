package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
	"github.com/gorilla/mux"
	a "github.com/pprisn/test_scrapper/app"
	c "github.com/pprisn/test_scrapper/controllers"
)


func worker() {
  for {
    c.Worker()
    time.Sleep(60 * time.Second)
  }
}

func main() {
        go worker()  
	//Определим объект маршрутов
	router := mux.NewRouter()
	//Определим обработчики маршрутов
	router.HandleFunc("/api/user/new", c.CreateAccount).Methods("POST")
	router.HandleFunc("/api/user/login", c.Authenticate).Methods("POST")
	router.HandleFunc("/api/contacts/new", c.CreateContact).Methods("POST")
	router.HandleFunc("/api/me/contacts", c.GetContactsFor).Methods("GET") //  user/2/contacts
	router.HandleFunc("/api/admin/users", c.GetUsers).Methods("GET")
	router.HandleFunc("/api/admin/update/users", c.UpdateAccount).Methods("POST") //служебная функция для административных изменений данных списка учетных записей

	//Добавим требование запуска проверки middleware для объектов обработки маршрутов !
	router.Use(a.JwtAuthentication) //attach JWT auth middleware

	//Заглушка для не существующего маршрута !
	//router.NotFoundHandler = app.NotFoundHandler

	port := os.Getenv("PORT")
	if port == "" {
		port = "8000" //localhost
	}

	fmt.Println(port)

	err := http.ListenAndServe(":"+port, router) //Launch the app, visit localhost:8000/api
	if err != nil {
		fmt.Print(err)
	}

}
