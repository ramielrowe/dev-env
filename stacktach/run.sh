NL=`echo -ne '\015'`
screen -dmS stacktach
sleep 1.5
screen -S stacktach -X screen -t django
sleep 1.5
screen -S stacktach -p django -X stuff "python ~/stacktach_app/manage.py runserver 198.101.244.161:80$NL"
screen -S stacktach -X screen -t worker
sleep 1.5
screen -S stacktach -p worker -X stuff "export STACKTACH_DEPLOYMENTS_FILE=~/stacktach_app/etc/stacktach_worker_config.json && python ~/stacktach_app/worker/start_workers.py$NL"
