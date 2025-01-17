# kloudlite-platform

[kloudlite-platform](https://github.com/kloudlite.io/helm-charts/charts/kloudlite-platform) Helm Chart for installing and setting up kloudlite platform on your own hosted Kubernetes clusters.

![Version: v1.0.5](https://img.shields.io/badge/Version-v1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.5](https://img.shields.io/badge/AppVersion-v1.0.5-informational?style=flat-square)

## Get Repo Info

```console
helm repo add kloudlite https://kloudlite.github.io/helm-charts
helm repo update
```

## Install Chart

**Important:** only helm3 is supported</br>
**Important:** [kloudlite-operators](../kloudlite-operators) must be installed beforehand</br>
**Important:** ensure kloudlite CRDs have been installed</br>

```console
helm install [RELEASE_NAME] kloudlite/kloudlite-platform --namespace [NAMESPACE] [--create-namespace]
```

The command deploys kloudlite-agent on the Kubernetes cluster in the default configuration.

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Installing Nightly Releases

To list all nightly versions (**NOTE**: nightly versions are suffixed by `-nightly`)

```console
helm search repo kloudlite/kloudlite-platform --devel
```

To install
```console
helm install [RELEASE_NAME] kloudlite/kloudlite-platform --version [NIGHTLY_VERSION] --namespace [NAMESPACE] --create-namespace
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME] -n [NAMESPACE]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] kloudlite/kloudlite-platform --install --namespace [NAMESPACE]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values kloudlite/kloudlite-platform
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| accountName | string | `"kloudlite"` | kloudlite account name, required only for labelling purposes, does not need to be a real kloudlite account name |
| apps.accountsApi.configuration | object | `{}` |  |
| apps.accountsApi.image | string | `"ghcr.io/kloudlite/platform/apis/accounts:v1.0.5-nightly"` | image (with tag) for accounts api |
| apps.accountsWeb.image | string | `"ghcr.io/kloudlite/platform/web/accounts-web:v1.0.5-nightly"` | image (with tag) for accounts web |
| apps.auditLoggingWorker.image | string | `"ghcr.io/kloudlite/platform/apis/audit-logging-worker:v1.0.5-nightly"` | image (with tag) for audit logging worker |
| apps.authApi.configuration.grpcPort | int | `3001` |  |
| apps.authApi.configuration.oAuth2.enabled | bool | `false` | whether to enable oAuth2 |
| apps.authApi.configuration.oAuth2.github.appId | string | `"<github-app-id>"` | GitHub app id |
| apps.authApi.configuration.oAuth2.github.appPrivateKey | string | `"PGdpdGh1Yi1hcHAtcHJpdmF0ZS1rZXk+"` | GitHub app private key (base64 encoded) |
| apps.authApi.configuration.oAuth2.github.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/github"` | GitHub oAuth2 callback url |
| apps.authApi.configuration.oAuth2.github.clientId | string | `"<github-client-id>"` | GitHub oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.github.clientSecret | string | `"<github-client-secret>"` | GitHub oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.github.enabled | bool | `false` | whether to enable GitHub oAuth2 |
| apps.authApi.configuration.oAuth2.github.githubAppName | string | `"kloudlite-dev"` | GitHub app name, that we want to install on user's GitHub account |
| apps.authApi.configuration.oAuth2.gitlab.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/gitlab"` | gitlab oAuth2 callback url |
| apps.authApi.configuration.oAuth2.gitlab.clientId | string | `"<gitlab-client-id>"` | gitlab oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.gitlab.clientSecret | string | `"<gitlab-client-secret>"` | gitlab oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.gitlab.enabled | bool | `false` | whether to enable gitlab oAuth2 |
| apps.authApi.configuration.oAuth2.google.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/google"` | google oAuth2 callback url |
| apps.authApi.configuration.oAuth2.google.clientId | string | `"<google-client-id>"` | google oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.google.clientSecret | string | `"<google-client-secret>"` | google oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.google.enabled | bool | `false` | whether to enable google oAuth2 |
| apps.authApi.image | string | `"ghcr.io/kloudlite/platform/apis/auth:v1.0.5-nightly"` | image (with tag) for auth api |
| apps.authWeb.image | string | `"ghcr.io/kloudlite/platform/web/accounts-web:v1.0.5-nightly"` | image (with tag) for auth web |
| apps.commsApi.configuration | object | `{"accountsWebInviteUrl":"https://auth.platform.kloudlite.io/invite","kloudliteConsoleWebUrl":"https://console.platform.kloudlite.io","projectsWebInviteUrl":"https://auth.platform.kloudlite.io/invite","resetPasswordWebUrl":"https://auth.platform.kloudlite.io/reset-password","sendgridApiKey":null,"supportEmail":null,"verifyEmailWebUrl":"https://auth.platform.kloudlite.io/verify-email"}` | configurations for comms api |
| apps.commsApi.configuration.accountsWebInviteUrl | string | `"https://auth.platform.kloudlite.io/invite"` | account web invite url |
| apps.commsApi.configuration.kloudliteConsoleWebUrl | string | `"https://console.platform.kloudlite.io"` | console web invite url |
| apps.commsApi.configuration.projectsWebInviteUrl | string | `"https://auth.platform.kloudlite.io/invite"` | project web invite url |
| apps.commsApi.configuration.resetPasswordWebUrl | string | `"https://auth.platform.kloudlite.io/reset-password"` | reset password web url |
| apps.commsApi.configuration.sendgridApiKey | string | `nil` | sendgrid api key for email communications, if (sendgrid.enabled) |
| apps.commsApi.configuration.supportEmail | string | `nil` | email through which we should be sending emails to target users, if (sendgrid.enabled) |
| apps.commsApi.configuration.verifyEmailWebUrl | string | `"https://auth.platform.kloudlite.io/verify-email"` | verify email web url |
| apps.commsApi.enabled | bool | `true` | whether to enable communications api |
| apps.commsApi.image | string | `"ghcr.io/kloudlite/platform/apis/comms:v1.0.5-nightly"` | image (with tag) for comms api |
| apps.consoleApi.configuration.vpnDevicesMaxOffset | int | `255` |  |
| apps.consoleApi.configuration.vpnDevicesOffsetStart | int | `5` |  |
| apps.consoleApi.image | string | `"ghcr.io/kloudlite/platform/apis/console:v1.0.5-nightly"` | image (with tag) for console api |
| apps.consoleWeb.image | string | `"ghcr.io/kloudlite/platform/web/console-web:v1.0.5-nightly"` | image (with tag) for console web |
| apps.containerRegistryApi.configuration.authorizerPort | int | `4000` |  |
| apps.containerRegistryApi.configuration.eventListenerPort | number | `4001` | port on which container registry event listener should listen |
| apps.containerRegistryApi.configuration.harbor | object | `{"adminPassword":"<harbor-admin-password>","adminUsername":"<harbor-admin-username>","apiVersion":"v2.0","imageRegistryHost":"<harbor-registry-host>","webhookAuthz":"<harbor-webhook-authz>","webhookEndpoint":"https://webhooks.platform.kloudlite.io/harbor","webhookName":"kloudlite-dev-webhook"}` | harbor configuration, required only if .apps.containerRegistryApi.enabled |
| apps.containerRegistryApi.configuration.harbor.adminPassword | string | `"<harbor-admin-password>"` | harbor api admin password |
| apps.containerRegistryApi.configuration.harbor.adminUsername | string | `"<harbor-admin-username>"` | harbor api admin username |
| apps.containerRegistryApi.configuration.harbor.apiVersion | string | `"v2.0"` | harbor api version |
| apps.containerRegistryApi.configuration.harbor.imageRegistryHost | string | `"<harbor-registry-host>"` | harbor image registry host |
| apps.containerRegistryApi.configuration.harbor.webhookAuthz | string | `"<harbor-webhook-authz>"` | harbor webhook authz secret |
| apps.containerRegistryApi.configuration.harbor.webhookEndpoint | string | `"https://webhooks.platform.kloudlite.io/harbor"` | harbor webhook endpoint, (for receiving webhooks for every images pushed) |
| apps.containerRegistryApi.configuration.harbor.webhookName | string | `"kloudlite-dev-webhook"` | harbor webhook name |
| apps.containerRegistryApi.configuration.registrySecret | string | `""` |  |
| apps.containerRegistryApi.enabled | bool | `true` |  |
| apps.containerRegistryApi.image | string | `"ghcr.io/kloudlite/platform/apis/container-registry:v1.0.5-nightly"` | image (with tag) for container registry api |
| apps.dnsApi.configuration | object | `{"dnsNames":["ns1.platform.kloudlite.io"],"edgeCNAME":"edge.platform.kloudlite.io"}` | configurations for dns api |
| apps.dnsApi.configuration.dnsNames | list | `["ns1.platform.kloudlite.io"]` | list of all dnsNames for which, you want wildcard certificate to be issued for |
| apps.dnsApi.configuration.edgeCNAME | string | `"edge.platform.kloudlite.io"` | base domain for CNAME for all the edges managed (or, to be managed) by this cluster |
| apps.dnsApi.enabled | bool | `false` |  |
| apps.dnsApi.image | string | `"ghcr.io/kloudlite/platform/apis/dns-api:v1.0.5-nightly"` | image (with tag) for dns api |
| apps.gatewayApi.image | string | `"ghcr.io/kloudlite/platform/apis/gateway:v1.0.5-nightly"` | image (with tag) for container registry api |
| apps.iamApi.configuration | object | `{}` |  |
| apps.iamApi.image | string | `"ghcr.io/kloudlite/platform/apis/iam:v1.0.5-nightly"` | image (with tag) for iam api |
| apps.infraApi.configuration.aws.accessKey | string | `""` |  |
| apps.infraApi.configuration.aws.cloudformation.params.trustedARN | string | `""` |  |
| apps.infraApi.configuration.aws.cloudformation.stackNamePrefix | string | `"kloudlite-access-stack"` |  |
| apps.infraApi.configuration.aws.cloudformation.stackS3URL | string | `""` |  |
| apps.infraApi.configuration.aws.secretKey | string | `""` |  |
| apps.infraApi.configuration.aws.tenantRoleFormatString | string | `"arn:aws:iam::%s:role/kloudlite-access-role"` |  |
| apps.infraApi.image | string | `"ghcr.io/kloudlite/platform/apis/infra:v1.0.5-nightly"` | image (with tag) for infra api |
| apps.messageOfficeApi.configuration.tokenHashingSecret | string | `"<token-hashing-secret>"` | consider using 128 characters random string, you can use `python -c "import secrets; print(secrets.token_urlsafe(128))"` |
| apps.messageOfficeApi.image | string | `"ghcr.io/kloudlite/platform/apis/message-office:v1.0.5-nightly"` | image (with tag) for message office api |
| apps.messagesDistributionWorker.configuration.kafkaConsumerGroupId | string | `"messages-distribution-worker"` |  |
| apps.messagesDistributionWorker.configuration.newTopicPartitionCount | int | `3` |  |
| apps.messagesDistributionWorker.configuration.newTopicReplicationCount | int | `1` |  |
| apps.messagesDistributionWorker.enabled | bool | `true` |  |
| apps.messagesDistributionWorker.image | string | `"ghcr.io/kloudlite/platform/workers/messages-distribution-worker:v1.0.5-nightly"` | image (with tag) for audit logging worker |
| apps.webhooksApi.configuration.webhookAuthz.githubSecret | string | `"<webhook-authz-github-secret>"` | webhook authz secret for GitHub webhooks |
| apps.webhooksApi.configuration.webhookAuthz.gitlabSecret | string | `"<webhook-authz-gitlab-secret>"` | webhook authz secret for gitlab webhooks |
| apps.webhooksApi.configuration.webhookAuthz.harborSecret | string | `"<harbor-webhook-authz>"` | webhook authz secret for harbor webhooks |
| apps.webhooksApi.configuration.webhookAuthz.kloudliteSecret | string | `"<webhook-authz-kloudlite-secret>"` | webhook authz secret for kloudlite internal calls |
| apps.webhooksApi.enabled | bool | `true` |  |
| apps.webhooksApi.image | string | `"ghcr.io/kloudlite/platform/apis/webhooks:v1.0.5-nightly"` | image (with tag) for webhooks api |
| baseDomain | string | `"platform.kloudlite.io"` | base domain for all routers exposed through this cluster |
| cloudflareWildCardCert.cloudflareCreds | object | `{"email":"<cloudflare-email>","secretToken":"<cloudflare-secret-token>"}` | cloudflare authz credentials |
| cloudflareWildCardCert.cloudflareCreds.email | string | `"<cloudflare-email>"` | cloudflare authorized email |
| cloudflareWildCardCert.cloudflareCreds.secretToken | string | `"<cloudflare-secret-token>"` | cloudflare authorized secret token |
| cloudflareWildCardCert.create | bool | `true` |  |
| cloudflareWildCardCert.domains | list | `["*.platform.kloudlite.io"]` | list of all SANs (Subject Alternative Names) for which wildcard certs should be created |
| cloudflareWildCardCert.name | string | `"kl-cert-wildcard"` | name for wildcard cert |
| cloudflareWildCardCert.secretName | string | `"kl-cert-wildcard-tls"` | k8s secret where wildcard cert should be stored |
| clusterInternalDNS | string | `"cluster.local"` | cluster internal DNS name |
| clusterIssuer.acmeEmail | string | `"sample@example.com"` | email that should be used for communicating with lets-encrypt services |
| clusterIssuer.create | bool | `true` | whether to install cluster issuer |
| clusterIssuer.name | string | `"cluster-issuer"` | name of cluster issuer, to be used for issuing wildcard cert |
| clusterName | string | `"platform"` | kloudlite cluster name, required only for labelling purposes, does not need to be a real kloudlite cluster name |
| clusterSvcAccount | string | `"kloudlite-cluster-svc-account"` | service account for privileged k8s operations, like creating namespaces, apps, routers etc. |
| cookieDomain | string | `".platform.kloudlite.io"` | cookie domain dictates at what domain, the cookies should be set for auth or other purposes |
| defaultProjectWorkspaceName | string | `"default"` | default project workspace name, the one that should be auto created, whenever you create a project |
| helmCharts.cert-manager.enabled | bool | `true` |  |
| helmCharts.cert-manager.name | string | `"cert-manager"` |  |
| helmCharts.container-registry.enabled | bool | `true` |  |
| helmCharts.container-registry.name | string | `"container-registry"` |  |
| helmCharts.descheduler.enabled | bool | `true` |  |
| helmCharts.descheduler.name | string | `"descheduler"` |  |
| helmCharts.grafana.configuration.nodeSelector."kloudlite.io/cloud-provider.az" | string | `"ap-south-1a"` |  |
| helmCharts.grafana.configuration.volumeSize | string | `"2Gi"` |  |
| helmCharts.grafana.enabled | bool | `true` |  |
| helmCharts.grafana.name | string | `"grafana"` |  |
| helmCharts.ingress-nginx.configuration.controllerKind | string | `"Deployment"` | can be DaemonSet or Deployment |
| helmCharts.ingress-nginx.configuration.ingressClassName | string | `"ingress-nginx"` |  |
| helmCharts.ingress-nginx.configuration.nodeSelector."node-role.kubernetes.io/control-plane" | string | `"true"` |  |
| helmCharts.ingress-nginx.configuration.tolerations[0].effect | string | `"NoExecute"` |  |
| helmCharts.ingress-nginx.configuration.tolerations[0].key | string | `"masters"` |  |
| helmCharts.ingress-nginx.configuration.tolerations[0].value | string | `"true"` |  |
| helmCharts.ingress-nginx.enabled | bool | `true` |  |
| helmCharts.ingress-nginx.name | string | `"ingress-nginx"` |  |
| helmCharts.kube-prometheus.configuration.alertmanager.nodeSelector."kloudlite.io/cloud-provider.az" | string | `"ap-south-1a"` |  |
| helmCharts.kube-prometheus.configuration.alertmanager.volumeSize | string | `"2Gi"` |  |
| helmCharts.kube-prometheus.configuration.prometheus.nodeSelector."kloudlite.io/cloud-provider.az" | string | `"ap-south-1a"` |  |
| helmCharts.kube-prometheus.configuration.prometheus.volumeSize | string | `"2Gi"` |  |
| helmCharts.kube-prometheus.enabled | bool | `true` |  |
| helmCharts.kube-prometheus.name | string | `"prometheus"` |  |
| helmCharts.loki-stack.configuration.s3credentials.awsAccessKeyId | string | `"<loki-s3-aws-access-key-id>"` |  |
| helmCharts.loki-stack.configuration.s3credentials.awsSecretAccessKey | string | `"<loki-s3-aws-secret-access-key>"` |  |
| helmCharts.loki-stack.configuration.s3credentials.bucketName | string | `"<loki-s3-bucket-name>"` |  |
| helmCharts.loki-stack.configuration.s3credentials.region | string | `"<loki-s3-bucket-region>"` |  |
| helmCharts.loki-stack.enabled | bool | `true` |  |
| helmCharts.loki-stack.name | string | `"loki-stack"` |  |
| helmCharts.redpanda-operator.configuration.resources | object | `{"limits":{"cpu":"60m","memory":"60Mi"},"requests":{"cpu":"40m","memory":"40Mi"}}` | cpu, and memory resources for redpanda operator |
| helmCharts.redpanda-operator.enabled | bool | `true` |  |
| helmCharts.redpanda-operator.name | string | `"redpanda-operator"` |  |
| helmCharts.strimzi-operator.enabled | bool | `true` |  |
| helmCharts.strimzi-operator.name | string | `"strimzi-operator"` |  |
| helmCharts.vector-agent.description | string | `"vector agent for shipping logs to centralized vector aggregator"` |  |
| helmCharts.vector-agent.enabled | bool | `true` |  |
| helmCharts.vector-agent.name | string | `"vector-agent"` |  |
| helmCharts.vector.enabled | bool | `true` |  |
| helmCharts.vector.name | string | `"vector"` |  |
| imagePullPolicy | string | `"Always"` | image pull policies for kloudlite pods, belonging to this chart |
| kloudlite_release | string | `"v1.0.5-nightly"` |  |
| managedServicesNodeSelector."kloudlite.io/cloud-provider.az" | string | `"ap-south-1a"` |  |
| nodeSelector | object | `{}` |  |
| normalSvcAccount | string | `"kloudlite-svc-account"` | service account for non k8s operations, just for specifying image pull secrets |
| operators.accountOperator | object | `{"enabled":true,"image":"ghcr.io/kloudlite/platform/operator/account:v1.0.5-nightly"}` | kloudlite account operator |
| operators.accountOperator.enabled | bool | `true` | whether to enable account operator |
| operators.accountOperator.image | string | `"ghcr.io/kloudlite/platform/operator/account:v1.0.5-nightly"` | image (with tag) for account operator |
| operators.byocOperator.enabled | bool | `true` | whether to enable byoc operator |
| operators.byocOperator.image | string | `"ghcr.io/kloudlite/platform/operator/byoc:v1.0.5-nightly"` | image (with tag) for byoc operator |
| operators.clusterOperator.configuration.IACStateStore.accessKey | string | `""` |  |
| operators.clusterOperator.configuration.IACStateStore.s3BucketName | string | `""` | s3 bucket name, to store kloudlite's infrastructure-as-code remote state |
| operators.clusterOperator.configuration.IACStateStore.s3BucketRegion | string | `""` | s3 bucket region, to store kloudlite's infrastructure-as-code remote state |
| operators.clusterOperator.configuration.IACStateStore.secretKey | string | `""` |  |
| operators.clusterOperator.configuration.cloudflare.apiToken | string | `""` | cloudflare api token, required to authenticate with cloudflare api |
| operators.clusterOperator.configuration.cloudflare.baseDomain | string | `""` | cloudflare base domain, on top of which CNAMES and wildcard names will be created |
| operators.clusterOperator.configuration.cloudflare.zoneId | string | `""` | cloudflare zone id, to manage CNAMEs and A records for managed clusters |
| operators.clusterOperator.configuration.jobImage.name | string | `"ghcr.io/kloudlite/infrastructure-as-code"` | required |
| operators.clusterOperator.configuration.jobImage.tag | string | `""` | optional |
| operators.clusterOperator.enabled | bool | `true` | whether to enable clusters operator |
| operators.clusterOperator.image | object | `{"name":"ghcr.io/kloudlite/operators/clusters"}` | cluster operator image |
| operators.clusterOperator.image.name | string | `"ghcr.io/kloudlite/operators/clusters"` | required |
| operators.clusterOperator.name | string | `"cluster-operator"` | resource watcher workload name |
| operators.nodepoolOperator.configuration.IACStateStore.s3BucketDir | string | `""` |  |
| operators.nodepoolOperator.configuration.IACStateStore.s3BucketName | string | `""` |  |
| operators.nodepoolOperator.configuration.IACStateStore.s3BucketRegion | string | `""` |  |
| operators.nodepoolOperator.configuration.cloudprovider | object | `{"accessKey":"","name":"aws","region":"ap-south-1","secretKey":""}` | cloudprovider name |
| operators.nodepoolOperator.configuration.cloudprovider.accessKey | string | `""` | cloudprovider access key |
| operators.nodepoolOperator.configuration.cloudprovider.name | string | `"aws"` | aws |
| operators.nodepoolOperator.configuration.cloudprovider.secretKey | string | `""` | cloudprovider secret key |
| operators.nodepoolOperator.configuration.k3s.joinToken | string | `""` |  |
| operators.nodepoolOperator.configuration.k3s.serverPublicHost | string | `""` |  |
| operators.nodepoolOperator.configuration.kloudlite.accountName | string | `"kloudlite"` |  |
| operators.nodepoolOperator.configuration.kloudlite.clusterName | string | `"dev"` |  |
| operators.nodepoolOperator.enabled | bool | `true` | whether to enable nodepool operator |
| operators.nodepoolOperator.image | string | `"ghcr.io/kloudlite/platform/operator/nodepool:v1.0.5-nightly"` | nodepool operator image |
| operators.nodepoolOperator.name | string | `"nodepool-operator"` | nodepool operator workload name |
| operators.resourceWatcher.enabled | bool | `true` | whether to enable resource watcher |
| operators.resourceWatcher.image | string | `"ghcr.io/kloudlite/operators/resource-watcher:v1.0.5-nightly"` | resource watcher image |
| operators.resourceWatcher.name | string | `"resource-watcher"` | resource watcher workload name |
| operators.wgOperator.configuration | object | `{"dnsHostedZone":"<dns-hosted-zone>","enableExamples":false,"podCIDR":"10.42.0.0/16","svcCIDR":"10.43.0.0/16"}` | wireguard configuration options |
| operators.wgOperator.configuration.dnsHostedZone | string | `"<dns-hosted-zone>"` | dns hosted zone, i.e., dns pointing to this cluster |
| operators.wgOperator.configuration.podCIDR | string | `"10.42.0.0/16"` | cluster pods CIDR range |
| operators.wgOperator.configuration.svcCIDR | string | `"10.43.0.0/16"` | cluster services CIDR range |
| operators.wgOperator.enabled | bool | `true` | whether to enable wg operator |
| operators.wgOperator.image | string | `"ghcr.io/kloudlite/operators/wireguard:v1.0.5-nightly"` | wg operator image and tag |
| persistence.storageClasses.ext4 | string | `"sc-ext4"` | ext4 storage class name |
| persistence.storageClasses.xfs | string | `"sc-xfs"` | xfs storage class name |
| podLabels | object | `{}` | podlabels for pods belonging to this release |
| preferOperatorsOnMasterNodes | bool | `true` |  |
| redpandaCluster | object | `{"create":true,"name":"redpanda","replicas":1,"resources":{"limits":{"cpu":"300m","memory":"400Mi"},"requests":{"cpu":"200m","memory":"200Mi"}},"storage":{"capacity":"2Gi"},"version":"v22.1.6"}` | redpanda cluster configuration, read more at https://vectorized.io/docs/quick-start-kubernetes |
| routers.accountsWeb | object | `{}` |  |
| routers.authWeb | object | `{}` |  |
| routers.consoleWeb | object | `{}` |  |
| routers.dnsApi | object | `{}` |  |
| routers.gatewayApi | object | `{}` |  |
| routers.messageOfficeApi | object | `{}` |  |
| routers.observabilityApi | object | `{}` |  |
| routers.socketWeb | object | `{}` |  |
| routers.webhooksApi.enabled | bool | `true` |  |
| tolerations | list | `[]` | tolerations for pods belonging to this release |
