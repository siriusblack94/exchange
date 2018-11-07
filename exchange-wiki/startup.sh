#!/bin/bash

chmod 777 /mnt/data/eureka/run.sh
chmod 777 /mnt/data/eureka/start.sh
chmod 777 /mnt/data/eureka/stop.sh
cd /mnt/data/eureka
source ./run.sh


chmod 777 /mnt/data/admin/run.sh
chmod 777 /mnt/data/admin/start.sh
chmod 777 /mnt/data/admin/stop.sh
cd /mnt/data/admin
source ./run.sh


chmod 777 /mnt/data/service/run.sh
chmod 777 /mnt/data/service/start.sh
chmod 777 /mnt/data/service/stop.sh
cd  /mnt/data/service
source ./run.sh


chmod 777 /mnt/data/user/run.sh
chmod 777 /mnt/data/user/start.sh
chmod 777 /mnt/data/user/stop.sh
cd /mnt/data/user
source ./run.sh


chmod 777 /mnt/data/chan/run.sh
chmod 777 /mnt/data/chan/start.sh
chmod 777 /mnt/data/chan/stop.sh
cd /mnt/data/chan
source ./run.sh


chmod 777 /mnt/data/task/run.sh
chmod 777 /mnt/data/task/start.sh
chmod 777 /mnt/data/task/stop.sh
cd /mnt/data/task
source ./run.sh