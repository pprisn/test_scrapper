package controllers

import (
	"encoding/json"
	m "github.com/pprisn/test_scrapper/models"
	u "github.com/pprisn/test_scrapper/utils"
	"net/http"
)


var GetUrls = func(w http.ResponseWriter, r *http.Request) {
	id := r.Context().Value("user").(uint)
	role := m.GetRole(id)
	if role == "admin" {
		data := m.GetUrls()
		resp := u.Message(true, "success")
		resp["data"] = data
		u.Respond(w, resp)
	} else {
		resp := u.Message(false, "access denied")
		u.Respond(w, resp)
	}

}


var GetUrl = func(w http.ResponseWriter, r *http.Request) {
	user := r.Context().Value("user").(uint) //Grab the id of the user that send the request
	url  := &m.Urls{}
	err := json.NewDecoder(r.Body).Decode(url)
	if err != nil {
		u.Respond(w, u.Message(false, "Error while decoding request body"))
		return
	}
        data := m.ReqUrlName(user,url.Name) //кто запросил и что запросили
	resp := u.Message(true, "success")
	resp["data"] = data
	u.Respond(w, resp)
}
