package main

import (
	"context"
	"github.com/gorilla/mux"
	a "github.com/pprisn/test_scrapper/app"
	c "github.com/pprisn/test_scrapper/controllers"
	"gopkg.in/natefinch/lumberjack.v2"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
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
	router.HandleFunc("/api/admin/urls", c.GetUrls).Methods("GET")
	router.HandleFunc("/api/user/url", c.GetUrl).Methods("POST")                  //user/2/contacts
	router.HandleFunc("/api/admin/update/users", c.UpdateAccount).Methods("POST") //служебная функция для административных изменений данных списка учетных записей

	//Добавим требование запуска проверки middleware для объектов обработки маршрутов !
	router.Use(a.JwtAuthentication) //attach JWT auth middleware

	//Заглушка для не существующего маршрута !
	//router.NotFoundHandler = app.NotFoundHandler

	port := os.Getenv("PORT")
	if port == "" {
		port = "8000" //localhost
	}

	LOG_FILE_LOCATION := os.Getenv("LOG_FILE_LOCATION")
	if LOG_FILE_LOCATION != "" {
		log.SetOutput(&lumberjack.Logger{
			Filename:   LOG_FILE_LOCATION,
			MaxSize:    500, // megabytes
			MaxBackups: 3,
			MaxAge:     28,   //days
			Compress:   true, // disabled by default
		})
	}

	srv := &http.Server{
		Handler:      router,
		Addr:         ":" + port,
		ReadTimeout:  10 * time.Second,
		WriteTimeout: 10 * time.Second,
	}

	go func() {
		log.Println("Starting Server")
		if err := srv.ListenAndServe(); err != nil {
			log.Fatal(err)
		}
	}()

	// Graceful Shutdown
	waitForShutdown(srv)

	//	fmt.Println(port)
	//
	//	err := http.ListenAndServe(":"+port, router) //Launch the app, visit localhost:8000/api
	//	if err != nil {
	//		fmt.Print(err)
	//	}

}

func waitForShutdown(srv *http.Server) {
	interruptChan := make(chan os.Signal, 1)
	signal.Notify(interruptChan, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	// Block until we receive our signal.
	<-interruptChan

	// Create a deadline to wait for.
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*10)
	defer cancel()
	srv.Shutdown(ctx)

	log.Println("Shutting down")
	os.Exit(0)
}
