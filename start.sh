docker pull horizon12275/ActionTest:latest
docker rm -f TG-test||true&&docker run  --name=TG-test -d -p 8082:8082 horizon12275/ActionTest:latest
docker image prune -af