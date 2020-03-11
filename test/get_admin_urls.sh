#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjEsImV4cCI6MTU4Mzc4NjU1NywiaXNzIjoidGVzdCJ9.SdmR8KB1vIyZN2sM_LKzomBmn7sws5MgRvbNyQUNQ0c
curl -H 'Accept: application/json' -H "Authorization: Bearer ${TOKEN}" http://localhost:8000/api/admin/urls

#Response
# 

