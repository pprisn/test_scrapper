#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4MzkyMDQyNiwiaXNzIjoidGVzdCJ9.DfEvYOzjiQk0offwwI2WGXgejojJpe7ALn3elcKh4Uw
curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:8000/api/admin/users

#Response
#{"message":"access denied","status":false}

