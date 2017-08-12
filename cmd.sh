echo '1. Start Lampp'
echo '2. Dump mysql database'
echo '3. chmod htdocs directory and file'
read pil

if [[ $pil == '1' ]]; then
	sudo /opt/lampp/lampp start
elif [[ $pil == '2' ]]; then
	echo 'Nama database'
	read db
	/opt/lampp/bin/mysqldump -u root $db > ~/NetBeansProjects/nsp/dump.sql
elif [[ $pil == '3' ]]; then
	sudo find /opt/lampp/htdocs -type d -exec chmod 777 {} \;
	sudo find /opt/lampp/htdocs -type f -exec chmod 644 {} \;
fi


