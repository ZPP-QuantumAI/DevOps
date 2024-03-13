deployment_name=$1
replicas=$(kubectl get deployment $deployment_name -o=jsonpath='{.spec.replicas}')
kubectl scale deployment $deployment_name --replicas=0
kubectl scale deployment $deployment_name --replicas=$replicas