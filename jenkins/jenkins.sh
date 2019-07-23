wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt install jenkins -y
cp jenkins /etc/default/jenkins
ufw allow OpenSSH
ufw enable
ufw allow 8082
ufw allow 9080
ufw allow 8080
ufw status
systemctl restart jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword