# Docker-For-EM-Course
임베디드 마스터 과정 수업 진행을 위한 도커 환경 구성  

# 카페 및 유튜브
에디로봇아카데미: https://cafe.naver.com/eddicorp  
유튜브: https://www.youtube.com/channel/UCaYlgiL6pS2N5pxnXXd_6-w  

# 라이브러리 설치시 (시간 및 키보드 설정)
시간 설정은 한국 시간, 키보드 설정은 미국입니다.  
6, 69, 31, 1 순서로 넣으면 됩니다.  
혹시 모르니 확인 하시길 바랍니다.  

# 작업 완료 이후 docker 업데이트
```make
docker ps -a로 현재 컨테이너 id와 이미지 이름 파악
docker commit [container id] [image]
```
