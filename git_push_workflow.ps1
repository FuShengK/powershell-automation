# Check if there are any files to commit
if ((git status --porcelain | Measure-Object).Count -eq 0) {
    Write-Host "No changes to commit."
    exit
}

# Attempt to add all changes to the staging area
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to add changes to the staging area."
    exit
}

# Ask the user for a commit message
$commitMessage = Read-Host "Enter the commit message"

# Attempt to commit the changes
git commit -m "$commitMessage"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Commit failed. Please make sure you have changes to commit and try again."
    exit
}

# Attempt to push the changes to the remote repository
git push
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to push changes to the remote repository."
    exit
}

Write-Host "Changes have been successfully committed and pushed to the remote repository."
