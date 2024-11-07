

#1.2
docker build -t encoding-word --build-arg ARG_MOT=Etienne .


# 1.3 
docker run --name ctn-encoding -d -p 9191:80 encoding-word:latest


# 1.6
docker compose up -d

# 1.7  
docker compose stop ctn-encoding

docker compose rm ctn-encoding