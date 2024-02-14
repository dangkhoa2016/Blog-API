<!-- user email: aldo_gutmann@white-tremblay.name -->
<!-- user password: 123456 -->

curl -X POST -H "Content-Type: application/json" -d '{ "user": {"email":"aldo_gutmann@white-tremblay.name", "password":"123456"}}' http://localhost:3001/users/login -v

<!-- token: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk5NjA1MjQyLCJleHAiOjE3MDA4MTQ4NDIsImp0aSI6ImRjODExZWRjLTljZTAtNGMzZS1hOTIxLTkxYjY5ODAyMjdlNyJ9.Rwv9AjWxngIQ0eX9TxI7CjYWjIdgBAa235IpZJpWGHw -->

curl -X GET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk5NjA1MjQyLCJleHAiOjE3MDA4MTQ4NDIsImp0aSI6ImRjODExZWRjLTljZTAtNGMzZS1hOTIxLTkxYjY5ODAyMjdlNyJ9.Rwv9AjWxngIQ0eX9TxI7CjYWjIdgBAa235IpZJpWGHw" http://localhost:3001/api/v1/android/posts

curl -X GET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk5NjA1MjQyLCJleHAiOjE3MDA4MTQ4NDIsImp0aSI6ImRjODExZWRjLTljZTAtNGMzZS1hOTIxLTkxYjY5ODAyMjdlNyJ9.Rwv9AjWxngIQ0eX9TxI7CjYWjIdgBAa235IpZJpWGHw" http://localhost:3001/api/v1/android/posts/1/comments


curl -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Iiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk5NjA1MjQyLCJleHAiOjE3MDA4MTQ4NDIsImp0aSI6ImRjODExZWRjLTljZTAtNGMzZS1hOTIxLTkxYjY5ODAyMjdlNyJ9.Rwv9AjWxngIQ0eX9TxI7CjYWjIdgBAa235IpZJpWGHw" -d '{"comment": {"content":"This is the updated comment"}}' http://localhost:3001/api/v1/android/comments/165

