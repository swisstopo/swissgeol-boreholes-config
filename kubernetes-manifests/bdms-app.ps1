param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("delete","configure")]
    [string]$action,

    [Parameter(Mandatory=$true)]
    [ValidateSet("dev","int","prod")]
    [string]$context
)

# Default namespace
$namespace = "boreholes"

# Get the base path using the location of the script file
$basePath = Split-Path -Parent $MyInvocation.MyCommand.Definition

function PrepareContext {
  param (
      [string]$env
  )

  Write-Output "Prepare kubectl context: $env"
  kubectl config use-context $namespace-$env
  kubectl apply -f $basePath\namespaces\boreholes.yaml
  kubectl config set-context --current --namespace=$namespace

  # Configure helm locally
  helm repo add keel https://charts.keel.sh
  helm repo update
}

if ($action -eq 'delete') {
    Write-Output "Detele all resources on $context in the namespace $namespace"
    PrepareContext -env $context
    kubectl delete all --all --namespace=$namespace
    kubectl delete secret --all --namespace=$namespace
    helm uninstall keel keel/keel --namespace $namespace
}
elseif ($action -eq 'configure') {
    Write-Output "Apply manifests on $context in the namespace $namespace"
    PrepareContext -env $context

    helm install keel keel/keel --namespace $namespace

    kubectl apply -f $basePath\secrets\boreholes.$context.yaml

    kubectl apply -f $basePath\deployments\api.yaml
    kubectl apply -f $basePath\deployments\client.yaml
    kubectl apply -f $basePath\deployments\api-legacy.yaml

    kubectl apply -f $basePath\services\api.yaml
    kubectl apply -f $basePath\services\client.yaml
    kubectl apply -f $basePath\services\api-legacy.yaml
}
else {
    Write-Output "Invalid action specified: $action"
}
