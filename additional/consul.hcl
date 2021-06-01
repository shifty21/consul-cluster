data_dir = "/tmp/consul"
log_level = "DEBUG"

datacenter = "dc1"
primary_datacenter = "dc1"

server = true

bootstrap_expect = 1
ui = true
# only in followers retry_join = ["34.123.159.113"]
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "192.168.0.136"

ports {
  grpc = 8502
}

connect {
  enabled = true
}

config_entries {
  # We are using gateways and L7 config set the 
  # default protocol to HTTP
  bootstrap 
    {
      kind = "proxy-defaults"
      name = "global"

      config {
        protocol = "http"
      }

      mesh_gateway = {
        mode = "local"
      }
    }
}