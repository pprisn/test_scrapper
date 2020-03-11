#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4Mzk1NzMwMiwiaXNzIjoidGVzdCJ9.yYfOPoDmbuxtLrB5eftRx1MeBYREDrG_MHG5GrbrUik
curl -d '{"name" : "gfacebook.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
#Response
#{"data":{"ID":3,"CreatedAt":"0001-01-01T00:00:00Z","UpdatedAt":"2020-03-11T12:33:53+03:00","DeletedAt":null,"name":"gfacebook.com","timeout80":"1","timeout443":"2"},"message":"success","status":true}
