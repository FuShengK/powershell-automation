$ErrorActionPreference = "Stop"

$projectID = "YOUR_PROJECT_ID"
$imageName = "YOUR_IMAGE_NAME"
$imageTag = "YOUR_IMAGE_TAG"
$imagePath = "gcr.io/${projectID}/${imageName}:$imageTag"

docker build -t $imageName .
docker tag $imageName $imagePath
docker push $imagePath

docker rmi $imageName
docker rmi $imagePath

if (-not (Test-Path ".terraform")) {
    Write-Output "Terraform not initialized. Running terraform init..."
    terraform init
}

terraform apply -destroy -auto-approve
terraform apply -auto-approve

Write-Output "Deployment Complete"