curl -d '{"email" : "pprisn@mail.ru", "password" : "123456", "cod_valid" : "660375"}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/user/login

#Response
#{"account":{"ID":5,"CreatedAt":"2020-03-09T20:51:53+03:00","UpdatedAt":"2020-03-09T20:51:53+03:00","DeletedAt":null,"email":"pprisn@mail.ru","password":"","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4MzkyMDQyNiwiaXNzIjoidGVzdCJ9.DfEvYOzjiQk0offwwI2WGXgejojJpe7ALn3elcKh4Uw","cod_valid":"","user_name":"","user_role":"user"},"message":"Logged In","status":true}

