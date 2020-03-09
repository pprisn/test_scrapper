package controllers

import (
	"encoding/json"
	"net/http"

	m "github.com/pprisn/test_scrapper/models"
	u "github.com/pprisn/test_scrapper/utils"
)

var CreateAccount = func(w http.ResponseWriter, r *http.Request) {
	account := &m.Account{}
	err := json.NewDecoder(r.Body).Decode(account) //decode the request body into struct and failed if any error occur
	if err != nil {
		u.Respond(w, u.Message(false, "Invalid request"))
		return
	}
	resp := account.Create() //Create account
	u.Respond(w, resp)
}

var Authenticate = func(w http.ResponseWriter, r *http.Request) {

	account := &m.Account{}
	err := json.NewDecoder(r.Body).Decode(account) //decode the request body into struct and failed if any error occur
	if err != nil {
		u.Respond(w, u.Message(false, "Invalid request"))
		return
	}

	resp := m.Login(account.Email, account.Password, account.CodValid)
	u.Respond(w, resp)
}

var GetUsers = func(w http.ResponseWriter, r *http.Request) {
	id := r.Context().Value("user").(uint)
	role := m.GetRole(id)
	if role == "admin" {
		data := m.GetUsers()
		resp := u.Message(true, "success")
		resp["data"] = data
		u.Respond(w, resp)
	} else {
		resp := u.Message(false, "access denied")
		u.Respond(w, resp)
	}

}

//Административная функция для внесения изменений в учетные данные пользователя
var UpdateAccount = func(w http.ResponseWriter, r *http.Request) {
	//Заполним новыми значениями поля для изменения учетных данных
	account := &m.Account{}
	err := json.NewDecoder(r.Body).Decode(account) //decode the request body into struct and failed if any error occur
	if err != nil {
		u.Respond(w, u.Message(false, "Invalid request"))
		return
	}
	resp := m.Update(
		account.Email,
		account.Password,
		account.UserName,
		account.UserRole,
		account.CodValid) //Update account
	u.Respond(w, resp)
}
