#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4Mzc4NDEzMSwiaXNzIjoidGVzdCJ9.VigFf5XN9amwCA98p2Pd7vcIBZnaE--fZyGAzbgCHvc
curl -d '{"name" : "gfacebook.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url

#Response
#{"message":"access denied","status":false}
