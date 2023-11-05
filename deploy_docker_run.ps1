$imageName = "YOUR_IMAGE_NAME"
$innerPort = 8080
$outerPort = 8080

# Stop and remove any existing containers built from the same image
$existingContainers = docker ps -a -q --filter "ancestor=${imageName}" --format "{{.ID}}"
if ($existingContainers) {
    Write-Host "Stopping and removing existing containers built from the image '${imageName}''..."
    docker stop $existingContainers | Out-Null
    docker rm $existingContainers | Out-Null
}

# Build the Docker image
Write-Host "Building Docker image '${imageName}'..."
docker build -t "${imageName}" .
if (-not $?) {
    Write-Host "Docker image build failed."
    exit 1
}

# Run the Docker container
Write-Host "Running Docker image named '${imageName}' on port ${outerPort}..."
docker run --env-file .env -p ${outerPort}:${innerPort} ${imageName}
if (-not $?) {
    Write-Host "Failed to start Docker container."
    exit 1
}

Write-Host "Docker Image '${imageName}' is now running on port ${outerPort}."
