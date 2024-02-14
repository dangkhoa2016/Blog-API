#!/bin/bash

## Registration

curl -H "Content-type: application/json" \
     -X POST \
     -d ' {"user":{"first_name":"Joh","email":"john@gmail.com","password":"123456789"}} ' \
      http://localhost:3000/users/register && echo

## 1 - Login correct

curl -H "Content-type: application/json" \
     -X POST -v \
     -d ' {"user":{"email":"john@gmail.com","password":"123456789"}} ' \
      http://localhost:3000/users/login

# 2 - Login incorrect

curl -H "Content-type: application/json" \
     -X POST \
     -d ' {"user":{"email":"john@gmail","password":"123456789"}} ' \
       http://localhost:3000/users/login


## DELETE Account

# 1 - Incorrect token

curl  -X DELETE \
      -H "Content-type: application/json" \
      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ1.eyJzdWIiOiIxMSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0Nzc3MSwiZXhwIjoxNzAwNTU3MzcxLCJqdGkiOiJiZGEwOTE3Ni1lMmY2LTQ5ZGEtODhmMi03OTlmMzllOGI4Y2UifQ.nzm5kksY_jKELHQyYWn-1pH_b2rMaWlA3TU1EOAlVSE" \
      -d '{"confirmation":{"password":"test"}} ' \
      http://localhost:3000/users

# 2 - Incorrect password: still work

curl  -X DELETE \
      -H "Content-type: application/json" \
      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNCIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODI3OCwiZXhwIjoxNzAwNTU3ODc4LCJqdGkiOiI0NWJkODM0ZS1mNjE4LTQ2YjMtOWJiYy01YTYyMTUxNjMwNzMifQ.5_5ouB9TRob58n2OmM5R8bZLI7KN80iMOVgqA1DM7wk" \
      -d '{"confirmation":{"password":""}} ' \
      http://localhost:3000/users


## Posts

### 1 - New post correct token
curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
     -X POST \
     -d ' {"post":{"title":"hello world","content":"THis is hello world post"}} ' \
       http://localhost:3000/api/v1/android/posts && echo

### 2 - New post incorrect token
curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ1.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
     -X POST \
     -d ' {"post":{"title":"hello world","content":"THis is hello world post"}} ' \
       http://localhost:3000/api/v1/android/posts && echo



### Get posts

# Incorrect token

curl -H "Content-type: application/json" \
     -X GET \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk5Mjg3MDcyLCJleHAiOjE3MDA0OTY2NzIsImp0aSI6Ijc0ZmJkNDBiLTJhMTktNDYwMi1hZTUzLTY0ZmEwNWM0ZGY3ZCJ9.OZ6LwpuwOBeHf-nD9JvEFC-KBQBXzOxeds67tcXhoZ4" \
     -d ' {"p":"1"} ' \
      http://localhost:3000/api/v1/android/posts && echo

# Correct token

curl -H "Content-type: application/json" \
     -X GET \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
     -d ' {"p":"1"} ' \
      http://localhost:3000/api/v1/android/posts && echo


### GET single post

curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
      http://localhost:3000/api/v1/android/posts/1 && echo

curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
      http://localhost:3000/api/v1/android/posts/51 && echo


### GET single post comments

curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
      http://localhost:3000/api/v1/android/posts/1/comments && echo

curl -H "Content-type: application/json" \
     -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY5OTM0ODMxNCwiZXhwIjoxNzAwNTU3OTE0LCJqdGkiOiIxMDhjOTQ4Yy1iMGE5LTRiNTQtYjllMy0wYTM5YWM5YmJlMTIifQ.IErj2oOupEPZuQ3_0s47dyPQ1fZFT95rw-krzywBcNQ" \
      http://localhost:3000/api/v1/android/posts/51/comments && echo

## Delete post
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQzMTU0MzE3fQ.yg_qrTxYNF_yniew2XjPYLsfR41NJMgQ0Q_mXIw0kik" \
#      -X DELETE \
#        http://localhost:3000/posts/1 && echo

# Comments
# new comment
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQxMTQxMjE1fQ.zIB2TdBP3q60XEPh0wFyxCqIGQyFz6ETuNBadd6vBcI" \
#      -X POST \
#      -d ' {"comment":{"content":"THis is test comment"}} ' \
#        http://localhost:3000/posts/7/comments && echo

# comments
# curl -H "Content-type: application/json" \
#        http://localhost:3000/posts/7/comments

# single comment
# curl -H "Content-type: application/json" \
#        http://localhost:3000/comments/2

# delete
# curl -H "Content-type: application/json" \
#      -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImpvaG5AZ21haWwuY29tIiwiZXhwIjoxNjQxMTQxMjE1fQ.zIB2TdBP3q60XEPh0wFyxCqIGQyFz6ETuNBadd6vBcI" \
#      -X DELETE http://localhost:3000/comments/2 && echo
