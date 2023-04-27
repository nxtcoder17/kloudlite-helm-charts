apiVersion: crds.kloudlite.io/v1
kind: App
metadata:
  name: {{.Values.apps.authWeb.name}}
  namespace: {{.Release.Namespace}}
  labels:
    kloudlite.io/account-ref: {{.Values.accountName}}
spec:
  region: {{.Values.region | default ""}}
  serviceAccount: {{.Values.normalSvcAccount}}

  {{ include "node-selector-and-tolerations" . | nindent 2 }}
  
  services:
    - port: 80
      targetPort: 3000
      name: http
      type: tcp
  containers:
    - name: main
      image: {{.Values.apps.authWeb.image}}
      imagePullPolicy: {{.Values.apps.authWeb.ImagePullPolicy | default .Values.imagePullPolicy }}
      resourceCpu:
        min: "100m"
        max: "200m"
      resourceMemory:
        min: "200Mi"
        max: "300Mi"
      env:
        - key: BASE_URL
          value: "{{.Values.baseDomain}}"
        - key: ENV
          value: "{{.Values.envName}}"
        - key: PORT
          value: "3000"
---