#!/bin/bash
TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjUsImV4cCI6MTU4NDMwODE2OCwiaXNzIjoidGVzdCJ9.rwclejX5B9mScuPFco6xnbZx4Br74DBPNhOPBFH0sQE
#curl -d '{"name" : "gfacebook.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
#Response
#{"data":{"ID":3,"CreatedAt":"0001-01-01T00:00:00Z","UpdatedAt":"2020-03-11T12:33:53+03:00","DeletedAt":null,"name":"gfacebook.com","timeout80":"1","timeout443":"2"},"message":"success","status":true}
curl -d '{"name" : "ggoogle.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "youtube.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "facebook.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "baidu.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "wikipedia.org", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "qq.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "taobao.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "yahoo.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "tmall.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "amazon.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.co.in", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "twitter.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "sohu.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "jd.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "live.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "instagram.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "sina.com.cn", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "weibo.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.co.jp", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "reddit.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "vk.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "360.cn", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "login.tmall.com ", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "blogspot.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "yandex.ru", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.com.hk", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "netflix.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "linkedin.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "pornhub.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.com.br", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "twitch.tv", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "pages.tmall.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "csdn.net", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "yahoo.co.jp", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "mail.ru", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "aliexpress.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "alipay.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "office.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.fr", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.ru", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "google.co.uk", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
curl -d '{"name" : "microsoftonline.com", "timeout80" : "", "timeout443" : ""}' -H "Content-Type: application/json"  -H "Authorization: Bearer ${TOKEN}" -X POST http://localhost:8000/api/user/url
