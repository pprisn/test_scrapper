curl -d '{"email" : "pprisn@yandex.ru", "password" : "123456", "cod_valid" : ""}' -H "Content-Type: application/json" -X POST http://localhost:8000/api/user/login

#Response
#{"cod_valid":"977267","message":"A verification cod_valid has been sent to you email, use it the next time you log in.","status":false}
#
