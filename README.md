# docker-piwik
Docker image for <a href="https://piwik.org/">Piwik</a>

Example Usage (in combination with the official <a href="https://hub.docker.com/_/mysql/">mysql docker container</a>)
```
git clone https://github.com/Finkes/docker-piwik.git
cd docker-piwik
docker build -t my-piwik .

// start mysql
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest

// start piwik
docker run --name some-piwik --link some-mysql:db -d my-piwik
```

