$ErrorActionPreference = "Stop"

# Set your project-specific details here
$projectID = "YOUR_PROJECT_ID"
$imageName = "YOUR_IMAGE_NAME"
$imageTag = "YOUR_IMAGE_TAG"
$imagePath = "gcr.io/${projectID}/${imageName}:$imageTag"

try {
    # Build the Docker image
    Write-Output "Building Docker image '${imageName}'..."
    docker build -t ${imageName} .

    # Tag the Docker image
    Write-Output "Tagging image as '${imagePath}'..."
    docker tag ${imageName} $imagePath

    # Push the image to Google Container Registry
    Write-Output "Pushing '${imagePath}' to Google Container Registry..."
    docker push ${imagePath}

    # Remove the local and tagged images to free up space
    Write-Output "Cleaning up local images..."
    docker rmi ${imageName}
    docker rmi ${imagePath}

    # Initialize Terraform if it hasn't been already
    if (-not (Test-Path ".terraform")) {
        Write-Output "Terraform not initialized. Running 'terraform init'..."
        terraform init
    }

    # Apply Terraform destruction to ensure idempotency
    Write-Output "Destroying previous Terraform-managed infrastructure..."
    terraform apply -destroy -auto-approve

    # Apply Terraform configuration
    Write-Output "Applying Terraform configuration..."
    terraform apply -auto-approve

    Write-Output "Deployment Complete"
}
catch {
    Write-Error "An error occurred: $_"
    exit 1
}
