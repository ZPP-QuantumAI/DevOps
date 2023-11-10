for f in *.yml; do
    kubectl apply -f $f
done