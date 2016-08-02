## Set the old version that we want to upgrade from.
export FROM_VERSION=9.5

sudo pacman -S --needed postgresql-old-upgrade
sudo chown postgres:postgres /var/lib/postgres/
sudo su - postgres -c "mv /var/lib/postgres/data /var/lib/postgres/data-${FROM_VERSION}"
sudo su - postgres -c 'mkdir /var/lib/postgres/data'
sudo su - postgres -c 'initdb --locale en_US.UTF-8 -E UTF8 -D /var/lib/postgres/data'
sudo su - postgres -c "pg_upgrade -b /opt/pgsql-${FROM_VERSION}/bin/ -B /usr/bin/ -d /var/lib/postgres/data-${FROM_VERSION} -D /var/lib/postgres/data"
