#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4Mzc4NDEzMSwiaXNzIjoidGVzdCJ9.VigFf5XN9amwCA98p2Pd7vcIBZnaE--fZyGAzbgCHvc
curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:8000/api/admin/urls

#Response
#{"message":"access denied","status":false}
