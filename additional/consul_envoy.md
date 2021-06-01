
Create a proxy for web-1
```
consul catalog services
consul config write ingress.hcl 
consul services register counting.hcl
envoy uses 19000 default port, add -admin-bind to change the port, in k8 deployment it should not clash
consul connect envoy -sidecar-for counting-2 -admin-bind localhost:19001 > dashboard-proxy.log &
consul connect envoy -sidecar-for web-1 > web-proxy.log &
```


```
consul agent -dev -client=0.0.0.0 -bind=0.0.0.0 -advertise=34.123.159.113
consul agent -dev -client=0.0.0.0 -bind=0.0.0.0 -advertise=192.168.0.136

consul agent -retry-join "34.123.159.113" -advertise=35.222.215.222 -data-dir 
consul config write ingress.hcl 
consul connect envoy -gateway=ingress -register -service ingress-service  -admin-bind localhost:19002 -address '{{ GetInterfaceIP "eth0" }}:8001'

consul connect envoy -gateway=ingress -register -service ingress-service -admin-bind localhost:19002 -bind-address sample="0.0.0.0:8001"

```

No sidecar proxy registered for discourse - check the service id is supplied not the service name

consul config delete -kind ingress-gateway -name ingress-service

consul config write ingress.hcl

consul force-leave web

v1.8.1-v1.11.2