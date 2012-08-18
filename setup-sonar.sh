#!/bin/sh

yum install -y java-1.6.0-openjdk ant liberation-mono-fonts urw-fonts unzip

pear config-set auto_discover 1
pear channel-discover pear.phpunit.de
pear channel-discover pear.symfony-project.com
pear install phpunit/PHPUnit-3.5.5
pear install phpunit/DbUnit

pear channel-discover pear.pdepend.org
pear install pdepend/PHP_Depend-0.10.7

pear channel-discover pear.phpmd.org
pear install --alldeps phpmd/PHP_PMD-1.2.0

pear install PHP_CodeSniffer-1.3.2

pear channel-discover components.ez.no
pear install phpunit/phpcpd-1.3.5

pear install phpunit/phploc
pear install pear.netpirates.net/phpDox-alpha
pear install --alldeps phpunit/PHP_CodeBrowser

cd ~
wget http://dist.sonar.codehaus.org/sonar-3.0.1.zip
unzip sonar-3.0.1.zip
mv sonar-3.0.1 /usr/local/sonar

echo '#!/bin/sh
#
# rc file for Sonar
#
# chkconfig: 345 96 10
# description: Sonar system (www.sonarsource.org)
#
### BEGIN INIT INFO
# Provides: sonar
# Required-Start: $network
# Required-Stop: $network
# Default-Start: 3 4 5
# Default-Stop: 0 1 2 6
# Short-Description: Sonar system (www.sonarsource.org)
# Description: Sonar system (www.sonarsource.org)
### END INIT INFO
 
/usr/bin/sonar $*' > /etc/init.d/sonar

sudo ln -s /usr/local/sonar/bin/linux-x86-64/sonar.sh /usr/bin/sonar
sudo chmod 755 /etc/init.d/sonar
sudo chkconfig --add sonar

