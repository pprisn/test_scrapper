package models

import (
	"fmt"
	"github.com/jinzhu/gorm"
	u "github.com/pprisn/test_scrapper/utils"
)

type Urls struct {
	gorm.Model
	Name       string `json:"name" gorm:"index:url_name"`
	Timeout80  string `json:"timeout80" gorm:"type:varchar(10)"`
	Timeout443 string `json:"timeout443" gorm:"type:varchar(10)"`
}

/*
 This struct function validate the required parameters sent through the http request body

returns message and true if the requirement is met
*/
func (urls *Urls) Validate() (map[string]interface{}, bool) {

	if urls.Name == "" {
		return u.Message(false, "Url name should be on the payload"), false
	}

	//	if urls.Timeout < 0 {
	//		return u.Message(false, "Timeout should be on the payload"), false
	//	}

	//All the required parameters are present
	return u.Message(true, "success"), true
}

func (urls *Urls) Create() map[string]interface{} {
	if resp, ok := urls.Validate(); !ok {
		return resp
	}
	GetDB().Create(urls)
	resp := u.Message(true, "success")
	resp["urls"] = urls
	return resp
}

func GetUrl(id uint) *Urls {
	urls := &Urls{}
	err := GetDB().Table("urls").Where("id = ?", id).First(urls).Error
	if err != nil {
		return nil
	}
	return urls
}

func GetByNameUrl(name string) *Urls {
	urls := &Urls{}
	err := GetDB().Table("urls").Where("name = ?", name).First(urls).Error
	if err != nil {
		return nil
	}
	return urls
}

func GetUrls() []*Urls {
	urls := make([]*Urls, 0)
	err := GetDB().Table("urls").Find(&urls).Error
	if err != nil {
		fmt.Println(err)
		return nil
	}

	return urls
}

func UpdateTimeout(id uint, tm string, stm string) {
	urls := &Urls{}
	err := GetDB().Table("urls").Where("id = ?", id).First(urls).Error
	if err != nil {
		if err == gorm.ErrRecordNotFound {
			return //u.Message(false, "Url address not found")
		}
		return //u.Message(false, "Connection error. Please retry")
	}
	GetDB().Model(urls).Where("id = ?", id).Updates(Urls{Timeout80: tm, Timeout443: stm})
	return
}

func ReqUrlName(user uint, name string) *Urls {
	urls := GetByNameUrl(name)
        acc  := GetUser(user)
	if urls != nil { //запрос не пустой
		//err := GetDB().Table("urls").Where("name = ?", name).First(urls).Error
		//запишем в журнал информацию об обращении
		journal := &Journal{UserId: user, UrlId: urls.ID, Request: name, Name: acc.Email }
		resp :=journal.Create()
                fmt.Printf("%v", resp)
		//	if err != nil {
		//                //journal not save
		//		return nil
		//	}
		return urls
	}
	return nil
}
