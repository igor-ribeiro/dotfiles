function start-vpn () {
  /opt/awsvpnclient/AWS\ VPN\ Client
}

function galley-clone () {
  gh repo clone galley-solutions/$@
}

alias eks-prod="aws-vault exec galley-prod -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-prod"
alias eks-staging="aws-vault exec galley-staging -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-staging"
alias eks-testing="aws-vault exec galley-testing -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-testing"
alias eks-ops="aws-vault exec galley-ops -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-ops"
alias eks-ops-private="aws-vault exec galley-ops -- aws eks update-kubeconfig --region us-west-2 --name main-private --profile galley-ops"
alias eks-dev="aws-vault exec galley-dev -- aws eks update-kubeconfig --region us-west-2 --name main --profile galley-dev"
