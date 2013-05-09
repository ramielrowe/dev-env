NL=`echo -ne '\015'`
screen -dmS stacktach
sleep 1.5
screen -S stacktach -X screen -t django
sleep 1.5
screen -S stacktach -p django -X stuff "python ~/stacktach_app/manage.py runserver 198.101.244.161:80$NL"
screen -S stacktach -X screen -t worker
sleep 1.5
screen -S stacktach -p worker -X stuff "export STACKTACH_DEPLOYMENTS_FILE=$STACKTACH_WORKER_CONFIG && python ~/stacktach_app/worker/start_workers.py$NL"
screen -S stacktach -X screen -t verifier
sleep 1.5
screen -S stacktach -p verifier -X stuff "export STACKTACH_VERIFIER_CONFIG=$STACKTACH_VERIFIER_CONFIG && python ~/stacktach_app/verifier/start_verifier.py$NL"
