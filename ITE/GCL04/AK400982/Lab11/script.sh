cmd() {
    kubectl rollout status deployment/mongo-database
}
if cmd | grep -q 'successfully rolled out'; then
  echo "Deployment is up and running"
else
  echo "Deployment is not running"
fi