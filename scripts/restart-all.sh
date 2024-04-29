for f in ../manifests/*.yml; do
    name_dot_yml=$(basename "$f")
    name=${name_dot_yml%.yml}
    echo "RESTARTING $name"
    bash restart.sh $name
    echo
done