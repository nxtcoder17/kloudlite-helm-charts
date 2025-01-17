apiVersion: crds.kloudlite.io/v1
kind: Router
metadata:
  name: {{.Values.routers.dnsApi.name}}
  namespace: {{.Release.Namespace}}
spec:
  ingressClass: {{ (index .Values.helmCharts "ingress-nginx").configuration.ingressClassName }}
  domains:
    - "{{.Values.routers.dnsApi.name}}.{{.Values.baseDomain}}"
  https:
    enabled: true
    clusterIssuer: {{.Values.clusterIssuer.name}}
    forceRedirect: true
  basicAuth:
    enabled: true
    username:  {{.Values.routers.dnsApi.name}}
  routes:
    - app: {{.Values.apps.dnsApi.name}}
      path: /
      port: 80
