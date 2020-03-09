package models

import (
	"fmt"
	"github.com/jinzhu/gorm"
	u "github.com/pprisn/test_scrapper/utils"
)

type Journal struct {
	gorm.Model
	Name    string  `json:"name";gorm:"varchar(100)"`
	Request string  `json:"request"`
	Timeout int     `json:"timeout"`
	User    Account `gorm:"foreingkey:UserId"`
	Urls    Urls    `gorm:"foreingkey:UrlId"`
	UrlId   uint    `json:"urlid"`
	UserId  uint    `json:"userid"` //ID of the user who submitted the request
}

/*
 This struct function validate the required parameters sent through the http request body

returns message and true if the requirement is met
*/
func (journal *Journal) Validate() (map[string]interface{}, bool) {

	if journal.Name == "" {
		return u.Message(false, "Contact name should be on the payload"), false
	}

	if journal.Request == "" {
		return u.Message(false, "Request should be on the payload"), false
	}

	if journal.UserId <= 0 {
		return u.Message(false, "User is not recognized"), false
	}
	if journal.UrlId <= 0 {
		return u.Message(false, "Url is not recognized"), false
	}

	//All the required parameters are present
	return u.Message(true, "success"), true
}

func (journal *Journal) Create() map[string]interface{} {
	if resp, ok := journal.Validate(); !ok {
		return resp
	}
	GetDB().Create(journal)
	resp := u.Message(true, "success")
	resp["journal"] = journal
	return resp
}

func GetJournal(id uint) *Journal {
	journal := &Journal{}
	err := GetDB().Table("journal").Where("id = ?", id).First(journal).Error
	if err != nil {
		return nil
	}
	return journal
}

func GetJournals(user uint) []*Journal {
	journals := make([]*Journal, 0)
	err := GetDB().Table("journal").Where("user_id = ?", user).Find(&journals).Error
	if err != nil {
		fmt.Println(err)
		return nil
	}

	return journals
}
