## Oracle 12c Enterprise Edition
-----
#### Begin
```
git clone https://github.com/luvres/oracle12c.git

cd oracle12c
```
#### Download Oracle 12c Enterprise Edition
```
./downloadOracle.sh
```
#### Building
```
docker build --force-rm=true --no-cache=true -t izone/oracle:12c .
```
#### Link to start database
```
sudo mkdir -p /opt/oracle12c

sudo curl -L http://raw.githubusercontent.com/luvres/oracle12c/master/oracle12c.png -o /opt/oracle12c/oracle12c.png
```
#### Run image
```
docker run --name Oracle -h enterprise -p 1521:1521 -d izone/oracle:12c
docker logs -f Oracle
```
#### Set password
```
docker exec Oracle ./setPassword.sh oracle
```
#### Link to Oracle 12c in Desktop
```
tee $HOME/Desktop/oracle.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Oracle EE
Icon=/opt/oracle12c/oracle12c.png
Exec=/usr/bin/gnome-terminal -e "docker exec -ti Oracle sqlplus system/oracle@ORCL"
EOF

chmod +x $HOME/Desktop/oracle.desktop
```
#### Link to Oracle 12c in Desktop (Portuguese)
```
tee $HOME/Área\ de\ Trabalho//oracle.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Oracle EE
Icon=/opt/oracle12c/oracle12c.png
Exec=/usr/bin/gnome-terminal -e "docker exec -ti Oracle sqlplus system/oracle@ORCL"
EOF

chmod +x $HOME/Área\ de\ Trabalho//oracle.desktop
```
#### Admininstration
```
docker stop Oracle
docker start Oracle
docker rm Oracle
```
-----
##### Check version
```
select banner from v$version;
```
##### Save image
```
docker save izone/oracle:12c > img-oracle12c.tar

split -b $((`ls -l | grep img-oracle12c.tar | awk '{print $5}'` /5+1)) img-oracle12c.tar img-oracle12c.part-
```
##### Load saved image
```
cat img-oracle12c.part-* >img-oracle12c.tar

docker load < img-oracle12c.tar
```
