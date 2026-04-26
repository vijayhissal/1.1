STEP 1: Create Project
 index.html
<!DOCTYPE html>
<html>
<head>
    <title>CI Demo</title>
</head>
<body>
    <h1>Hello DevOps</h1>
</body>
</html>
 Dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
 STEP 2: Push Code to GitHub
git init
git add .
git commit -m "CI Demo Initial"
git remote add origin https://github.com/your-username/your-repo.git
git push -u origin main

 (Use token instead of password)

 STEP 3: Open Jenkins
Open Jenkins in browser
Click New Item
Name: CI Demo
Select Freestyle Project
 STEP 4: Configure Git
Go to Source Code Management
Select Git
Paste your repo URL
 STEP 5: Enable CI Trigger
Go to Build Triggers
Enable Poll SCM
* * * * *

 Checks for changes every minute

 STEP 6: Add Build Commands (MOST IMPORTANT)

 Build → Execute Windows Batch Command

Paste:

type index.html
findstr "Hello DevOps" index.html
echo Building Docker Image...
docker build -t cd-demo .

echo Stopping old container...
docker stop cd-container
docker rm cd-container

echo Running new container...
docker run -d -p 8080:80 --name cd-container cd-demo

 STEP 7: Start Docker

 Open Docker Desktop
 Ensure it says Running

 STEP 8: Run Build

 Click Build Now

 EXPECTED OUTPUT
Code fetched from GitHub ✔
Test executed ✔
Docker image built ✔
Container running ✔
 STEP 9: Check Output

Open browser:

http://localhost:8080

 Output:

Hello DevOps
 STEP 10: DEMONSTRATE CI (VERY IMPORTANT)
Modify code:
<h1>Hello DevOps Updated</h1>
Push again:
git add .
git commit -m "Updated"
git push

 Jenkins will automatically trigger build
