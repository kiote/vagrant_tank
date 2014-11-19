apt-get update

apt-get install python-software-properties
apt-get install software-properties-common -y
add-apt-repository ppa:yandex-load/main

apt-get update
apt-get install yandex-load-tank-base

## you can rewrite default file with your own
tee /home/vagrant/load.ini <<- EOF
[phantom]
address=staging.legelisten.no:80
rps_schedule=const(1, 10m)
header_http = 1.1
headers = [Host: staging.legelisten.no]
  [Connection: close]
  [Authorization: Basic ZjR1OnRvcCBzZWNyZXQ=]
  [X-Request-With: XMLHttpRequest]
  [User-Agent: Tank]
uris = /
  /leger/429-adel-hameed-abedali
  /leger/429-adel-hameed-abedali/vurdering/ny
  /leger/429-adel-hameed-abedali?side=2
  /leger/429-adel-hameed-abedali?side=3
  /leger/Nord-Trøndelag/Namsos
  /dentist_autocomplete?term=aq
  /doctor_autocomplete?term=aw
writelog=1
EOF