```
VERSION=1.0.3
TAG=localhost:32000/quartz-runner:$VERSION
sudo docker build . -t $TAG
sudo docker push $TAG
```