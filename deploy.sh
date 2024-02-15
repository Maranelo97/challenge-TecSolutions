docker stop front-container
docker stop back-container
docker rm front-container
docker rm back-container


cd front
docker build -t front-image .
docker run -d --name front-container -p 80:80 frontend-image
cd ..


cd backend
docker build -t back-image .
docker run -d --name back-container -p 5000:5000 backend-image
cd ..


docker ps