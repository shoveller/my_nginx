FROM ubuntu
MAINTAINER cinos81 cinos81@gmail.com

# 환경변수 설정
ENV REFRESHED_AT 2017-03-14

# 패키지메니져 업데이트
RUN apt-get update

# nginx 설치
RUN apt-get -y -q install nginx

# html저장폴더 신설
# -p옵션을 사용하면, 폴더를 트리구조로 생성할 수 있다. 
RUN mkdir -p /var/www/html

# nginx의 전역 설정파일을 컨테이너로 복사
ADD nginx/global.conf /etc/nginx/conf.d/

# nginx의 로컬 설정파일을 컨테이너로 복사
ADD nginx/nginx.conf /etc/nginx/nginx.conf

# 포트 노출
EXPOSE 80
