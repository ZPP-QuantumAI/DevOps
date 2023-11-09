app_name=$1
namespace="zpp-quantumai"
file_path="next-version.txt"

current_version=$(grep -o '[0-9]*\.[0-9]*\.[0-9]*' "$file_path")

echo "Release version: $current_version"

while true; do
    read -p "Continue? [Y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 1;;
        * ) echo "Please answer y or n";;
    esac
done

docker build -t "$app_name:$new_version" "."
docker image tag "$app_name:$new_version" "ghcr.io/$namespace/$app_name:$new_version"
docker image tag "$app_name:$new_version" "ghcr.io/$namespace/$app_name:latest"
docker image push "ghcr.io/$namespace/$app_name:$new_version"
docker image push "ghcr.io/$namespace/$app_name:latest"

if [ "$?" -eq 1 ]; then
    exit 1
fi

echo "Released version $current_version!"

IFS='.'
read -r major minor patch <<< "$current_version"

((patch++))

new_version="$major.$minor.$patch"
echo "v$new_version" > next-version.txt
