# Guide Notes
Updated 2025-04-12
This guide covers the steps to install Docker Compose v2, configure user permissions, deploy a Capture The Flag (CTF) application, and manage running Docker containers.
## 1. Install Docker Compose v2
To install Docker Compose v2, run:\
`sudo apt install docker-compose-v2`\
Once installed, verify the installation:
`docker compose version`
This should return the installed version, confirming that Docker Compose v2 is ready to use.
## 2. Add User to the Docker Group
By default, Docker requires  sudo  privileges to run. To allow your user to execute Docker commands without
sudo, add yourself to the  docker  group:\
`sudo usermod -aG docker $USER`\
Then, apply the group changes without logging out:
`newgrp docker`
## 3. Move the CTF Application to the Web Directory
The CTF project folder (WVNCC-CTF) needs to be placed in the web root directory (`/var/www/html`) for
deployment.
Move the project folder:\
`sudo mv WVNCC-CTF/ /var/www/html`\
You should only copy the files of WVNCC-CTF ~ not the entire directory. I just copied everything inside of WVNCC-CTF and pasted it in ~/html and trashed WVNCC-CTF.
## 4. Deploy the CTF Application
Navigate to the project directory:
`cd /var/www/html/`
Run the deployment script:\
`sudo python3 deploy.py`
## 5. Check Running Docker Containers
After deployment, verify the active Docker containers:\
`sudo docker ps`\
This command lists all running containers, showing their Container ID, Image, Command, Status, and Ports.
## 6. Stop a Running Docker Container
If you need to stop a running container, execute:\
`sudo docker stop <container_name>`\
The two containers are named `www` and `db`.
