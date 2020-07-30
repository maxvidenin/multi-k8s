docker build -t wetravel18/multi-client:latest wetravel18/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t wetravel18/multi-server:latest wetravel18/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t wetravel18/multi-worker:latest wetravel18/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push wetravel18/multi-client:latest
docker push wetravel18/multi-server:latest
docker push wetravel18/multi-worker:latest

docker push wetravel18/multi-client:$SHA
docker push wetravel18/multi-server:$SHA
docker push wetravel18/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=wetravel18/multi-server:$SHA
kubectl set image deployments/client-deployment client=wetravel18/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=wetravel18/multi-worker:$SHA
