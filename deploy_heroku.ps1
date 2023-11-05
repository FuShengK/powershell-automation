$appName = "YOUR_HEROKU_APP_NAME"
$commitMessage = Read-Host "Enter the commit message"

# Add all changes to git
git add .

# Commit the changes
git commit -m $commitMessage

# Check if already logged in to Heroku by running a harmless Heroku command
try {
    heroku apps --json | Out-Null
} catch {
    # If not logged in, the above command will throw an error, so login is required
    heroku login -i
}

# Check if Dockerfile exists in the current directory
if (Test-Path -Path "./Dockerfile") {
    # Log in to Container Registry
    heroku container:login

    # Build the image and push to Container Registry
    heroku container:push web -a $appName

    # Release the image to your app
    heroku container:release web -a $appName
} else {
    # If no Dockerfile, just push to Heroku git
    git push heroku main
}