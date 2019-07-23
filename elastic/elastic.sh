wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
sudo apt-get -y update
sudo useradd -p $(openssl passwd -1 es) elasticsearch
usermod -aG sudo elasticsearch
sudo apt install elasticsearch
sudo apt-get -y install kibana
cp elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp kibana.yml /opt/kibana/config/kibana.yml
sudo update-rc.d elasticsearch defaults
sudo update-rc.d kibana defaults
sudo -Hu elasticsearch sudo service elasticsearch start
sudo -Hu elasticsearch sudo service kibana start




#curl -X GET 'http://localhost:9200'

