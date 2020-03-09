package models

import (
	//	_ "github.com/jinzhu/gorm/dialects/postgres"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"

	_ "github.com/jinzhu/gorm/dialects/mysql"

	"github.com/joho/godotenv"
	"os"
)

var db *gorm.DB

func init() {

	e := godotenv.Load()
	if e != nil {
		fmt.Print(e)
	}

	username := os.Getenv("db_user")
	password := os.Getenv("db_pass")
	dbName := os.Getenv("db_name")
	dbHost := os.Getenv("db_host")

	//dbUri := fmt.Sprintf("host=%s user=%s dbname=%s sslmode=disable password=%s", dbHost, username, dbName, password)
	dbUri := fmt.Sprintf("%s:%s@(%s)/%s?charset=utf8&parseTime=True&loc=Local", username, password, dbHost, dbName)
	fmt.Println(dbUri)

	conn, err := gorm.Open("mysql", dbUri)
	//conn, err := gorm.Open("mysql", loging+"@(localhost)/scrapper?charset=utf8&parseTime=True&loc=Local")

	if err != nil {
		fmt.Print(err)
	}

	db = conn
	db.Debug().AutoMigrate(&Account{}, &Journal{}, &Urls{}, &Contact{})
}

func GetDB() *gorm.DB {
	return db
}

//////////////////////////////////////////////////////////////
