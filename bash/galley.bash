function start-vpn () {
  /opt/awsvpnclient/AWS\ VPN\ Client
}

function galley-clone () {
  gh repo clone galley-solutions/$@
  cd $1
}

alias eks-prod="aws-vault exec galley-prod -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-prod"
alias eks-staging="aws-vault exec galley-staging -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-staging"
alias eks-testing="aws-vault exec galley-testing -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-testing"
alias eks-ops="aws-vault exec galley-ops -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-ops"
alias eks-ops-private="aws-vault exec galley-ops -- aws eks update-kubeconfig --region us-west-2 --name main-private --profile galley-ops"
alias eks-dev="aws-vault exec galley-dev -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-dev"

function mob-scale-up() {
  mob_name=$1;

  if [ "$mob_name" = "" ]; then
    echo "ERROR: Missing mob name"
    return
  fi

  galley k8s-cron/scale-eks-mob
  MOB=$mob_name DESIRED=1 ./scale-up-eks-mob.sh
  
  deploy-avro-schemas $mob_name
}

function deploy-avro-schemas() {
  mob_name=$1;

  if [ "$mob_name" = "" ]; then
    echo "ERROR: Missing mob name"
    return
  fi

  galley avro-schemas
  yarn deploy:schemas http://schema-registry.$mob_name.galley.eng
  cd -
}

function enter-container() {
  container_name=$1;
  mob_name=$2;

  usage='USAGE:\n\tk8se <container-name> <mob-name>';

  if [ "$container_name" = "" ]; then
    echo "ERROR: Missing container name"
    echo -e $usage
    return 1
  fi

  if [ "$mob_name" = "" ]; then
    echo "ERROR: Missing mob name"
    echo -e "${usage/<container-name>/"$container_name"}"
    return
  fi

  pod=`kubectl get pod -n $mob_name | grep "^$container_name" | grep Running | head -n 1 | awk '{ print $1 }'`
  kubectl exec -it $pod -n $mob_name -- bash
}

alias console-ops="google-chrome --args --profile-directory=\"GalleyProfile\" \$(aws-vault login -s galley-ops)"
alias console-dev="google-chrome --args --profile-directory=\"GalleyProfile\" \$(aws-vault login -s galley-dev)"
alias console-prod="google-chrome --args --profile-directory=\"GalleyProfile\" \$(aws-vault login -s galley-prod)"
alias console-staging="google-chrome --args --profile-directory=\"GalleyProfile\" \$(aws-vault login -s galley-staging)"

function get-e2e-screenshots() {
  jobs=$(kubectl get pods --all-namespaces | grep 'jenkins')

  echo $jobs

  return

  kubectl cp $jenkins:/home/jenkins/agent/workspace/_solutions_jelly-frontend_$mob/jelly-galley-e2e/cypress/screenshots/ ./
}
