curl -d '{"email" : "pprisn@yandex.ru", "password" : "123456", "cod_valid" : "977267"}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/user/login

#Response
# {"account":{"ID":1,"CreatedAt":"2020-03-09T19:59:08+03:00","UpdatedAt":"2020-03-09T21:38:52+03:00","DeletedAt":null,"email":"pprisn@yandex.ru","password":"","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjEsImV4cCI6MTU4Mzc4NjU1NywiaXNzIjoidGVzdCJ9.SdmR8KB1vIyZN2sM_LKzomBmn7sws5MgRvbNyQUNQ0c","cod_valid":"","user_name":"pprisn","user_role":"admin"},"message":"Logged In","status":true}

