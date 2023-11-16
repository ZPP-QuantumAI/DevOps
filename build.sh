app_name=$1
namespace="zpp-quantumai"
file_path="next-version.txt"

current_version=$(grep -o '[0-9]*\.[0-9]*\.[0-9]*' "$file_path")

echo "Release version: $current_version"
echo "$app_name:$current_version"

docker build -t "$app_name:$current_version" "."
docker image tag "$app_name:$current_version" "ghcr.io/$namespace/$app_name:$current_version"
docker image tag "$app_name:$current_version" "ghcr.io/$namespace/$app_name:latest"
docker image push "ghcr.io/$namespace/$app_name:$current_version"
docker image push "ghcr.io/$namespace/$app_name:latest"

if [ "$?" -eq 1 ]; then
    exit 1
fi

echo "Released version $current_version!"

IFS='.'
read -r major minor patch <<< "$current_version"

((patch++))

new_version="$major.$minor.$patch"
echo "Next version $next_version"
echo "v$new_version" > next-version.txt
