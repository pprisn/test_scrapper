curl -d '{"email" : "pprisn@mail.ru", "password" : "123456"}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/user/new

#Response
#{"account":{"ID":5,"CreatedAt":"2020-03-09T20:51:53.268699778+03:00","UpdatedAt":"2020-03-09T20:51:53.268699778+03:00","DeletedAt":null,"email":"pprisn@mail.ru","password":"","token":"","cod_valid":"660375","user_name":"","user_role":"user"},"message":"Account has been created, Please confirm registration by sending a verification cod_valid at the next login.","status":true}

