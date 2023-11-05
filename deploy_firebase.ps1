# Check if Firebase CLI is logged in
firebase login --no-localhost --interactive
if (-not $?) {
    Write-Host "Firebase login failed."
    exit 1
}

# Check if Firebase is initialized by looking for firebase.json
if (-not (Test-Path -Path "./firebase.json")) {
    Write-Host "Firebase project not initialized. Initializing..."
    firebase init
    if (-not $?) {
        Write-Host "Firebase initialization failed."
        exit 1
    }
}

# Deploy to Firebase
Write-Host "Deploying to Firebase..."
firebase deploy
if (-not $?) {
    Write-Host "Firebase deployment failed."
    exit 1
}

Write-Host "Deployment successful!"
