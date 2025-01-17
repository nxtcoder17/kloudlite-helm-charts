---
apiVersion: crds.kloudlite.io/v1
kind: ManagedResource
metadata:
  name: {{.Values.managedResources.consoleDb}}
  namespace: {{.Release.Namespace}}
  labels:
    
spec:
  inputs:
    resourceName: {{.Values.managedResources.consoleDb}}
  msvcRef:
    apiVersion: mongodb.msvc.kloudlite.io/v1
    kind: StandaloneService
    name: {{.Values.managedServices.mongoSvc}}
  mresKind:
    kind: Database
---