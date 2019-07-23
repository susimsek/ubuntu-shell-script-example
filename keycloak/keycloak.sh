wget https://downloads.jboss.org/keycloak/6.0.1/keycloak-6.0.1.tar.gz
tar xzf keycloak-6.0.1.tar.gz
rm keycloak-6.0.1.tar.gz
mv keycloak-6.0.1 /opt/keycloak
/opt/keycloak/bin/add-user-keycloak.sh --user admin --password admin
curl -L http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.46/mysql-connector-java-5.1.46.jar -o /opt/keycloak/mysql-connector-java-5.1.46.jar
/opt/keycloak/bin/jboss-cli.sh --user=admin --password=admin --command="module add --name=org.mysql  --dependencies=javax.api,javax.transaction.api --resources=/opt/keycloak/mysql-connector-java-5.1.46.jar"
cp standalone.xml /opt/keycloak/standalone/configuration/standalone.xml
cp wildfly-init-debian.sh /opt/keycloak/docs/contrib/scripts/init.d/wildfly-init-debian.sh
cp /opt/keycloak/docs/contrib/scripts/init.d/wildfly-init-debian.sh /etc/init.d/keycloak
sudo chown -R root:root /opt/keycloak/
sudo service keycloak start
sudo update-rc.d keycloak defaults
/opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:9080/auth --realm master --user admin --password admin
/opt/keycloak/bin/kcadm.sh update realms/master -s sslRequired=NONE
sudo service keycloak restart
rm /opt/keycloak/mysql-connector-java-5.1.46.jar
#JBOSS_USER root START TIME ve END TIME 1000 yapıldı.
#./keycloak/bin/standalone.sh
