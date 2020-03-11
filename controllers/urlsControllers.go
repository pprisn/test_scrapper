package controllers

import (
//	"encoding/json"
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
