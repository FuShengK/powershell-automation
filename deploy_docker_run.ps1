$imageName = "YOUR_IMAGE_NAME"
$tag = "YOUR_TAG"
$innerPort = 8080
$outerPort = 8080
$containerName = "${imageName}-container"

# Stop and remove any existing containers built from the same image
$existingContainers = docker ps -a -q --filter "ancestor=$imageName:$tag" --format "{{.ID}}"
if ($existingContainers) {
    Write-Host "Stopping and removing existing containers built from the image '$imageName':'$tag'..."
    docker stop $existingContainers | Out-Null
    docker rm $existingContainers | Out-Null
}

# Build the Docker image
Write-Host "Building Docker image '$imageName':'$tag'..."
docker build -t "$imageName:$tag" .
if (-not $?) {
    Write-Host "Docker image build failed."
    exit 1
}

# Stop and remove any previously running container with the same name
$existingContainer = docker ps -a -q --filter "name=^$containerName$"
if ($existingContainer) {
    Write-Host "Stopping existing container with name '$containerName'..."
    docker stop $existingContainer | Out-Null
    docker rm $existingContainer | Out-Null
    if (-not $?) {
        Write-Host "Failed to stop and remove existing container."
        exit 1
    }
}

# Run the Docker container
Write-Host "Running Docker container named '$containerName' on port $outerPort..."
docker run -d --name $containerName --env-file .env -p "$outerPort:$innerPort" "$imageName:$tag"
if (-not $?) {
    Write-Host "Failed to start Docker container."
    exit 1
}

Write-Host "Container '$containerName' is now running on port $outerPort."