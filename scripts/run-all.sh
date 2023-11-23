for f in ../manifests/*.yml; do
    kubectl apply -f ../manifests/$f
done