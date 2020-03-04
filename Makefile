export DOCKER_BUILDKIT = 1

run:
	docker build --tag=ide .
	docker run -d --net=host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${PWD}/root:/root \
-e DISPLAY=${DISPLAY} ide:latest
