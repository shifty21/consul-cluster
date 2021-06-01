service {
  name = "web"
  id = "web-1"
  port = 8080
  connect {
   sidecar_service {}
  }
  check {
   id       = "web-check"
   http     = "http://localhost:8080"
   method   = "GET"
   interval = "10s"
   timeout  = "1s"
 }
}