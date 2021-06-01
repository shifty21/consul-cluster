Kind = "ingress-gateway"
Name = "ingress-service"

Listeners = [
  {
    Port     = 8001
    Protocol = "http"
    Services = [
      {
        Name = "web"
        Hosts= ["api.sky-mind.eu","sky-mind.eu","192.168.0.136"]
      }
    ]
  }
]