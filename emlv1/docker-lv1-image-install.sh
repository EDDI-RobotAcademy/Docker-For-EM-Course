#!/usr/bin/bash

id_res=$(id | grep docker)

if [ -n "$id_res" ];
then echo "docker가 이미 등록되어 있습니다!"
else
    echo "지금부터 docker를 등록합니다!"
    sudo usermod -aG docker $USER
    #newgrp docker
    exit
fi

docker_check=$(docker images | awk '{ print $2 }' | grep "20.04")
if [ -n "$docker_check" ];
then echo "이미 설치되어 있습니다!"
else
    echo "도커 이미지 설치!"
	docker pull ubuntu:20.04
fi

# 20.04
docker_ps_check=$(docker ps -a | grep "test-ubuntu" | awk '{ print $1 }')
if [ -n "$docker_ps_check" ];
then
    echo "ubuntu 20.04 컨테이너를 내립니다."
    docker rm $docker_ps_check
fi

sudo xhost +

# workspace에 실제 프로젝트 작업 진행하는 사항들을 배치하면 됩니다.
# 도커 기반으로 수업 진행하시는 분들은
# 수업 내용, 프로젝트 등등 코드를 여기에 배치해주세요.
# 현재 위치($cur_loc)의 workspace에 배치할 수도 있지만
# 특정 디렉토리에 정보를 배치하고 싶다면
# $cur_loc/workspace를 원하는 디렉토리로 변경하면 됩니다.
cur_loc=$(pwd)
docker run -it									\
	--privileged								\
    --net=host									\
	-e DISPLAY=$DISPLAY							\
	--env="DISPLAY"								\
	-v /dev:/dev								\
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw			\
	-v $cur_loc/workspace:/root/workspace 		\
	-w /root/workspace							\
	--name test-ubuntu ubuntu:20.04 			\
	/bin/bash;

#-v $cur_loc/workspace:/home/$USER/workspace \
