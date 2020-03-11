#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4Mzk1NzAzNywiaXNzIjoidGVzdCJ9.UQpvssCw23lkluWVQBlXn_zyjdYi-d7bi25h21Vkh-8
curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:8000/api/admin/urls

#Response
#{"message":"access denied","status":false}
