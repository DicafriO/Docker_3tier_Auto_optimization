Docker로 3tier (Web-Was-DB) 구조 이중화 구축 (docker-compose version) + War 파일 배포 실습
=========================================================================================


### 1. docker build -t ubuntu:khl-test . 명령어로 기본이 되는 Base Image 생성 후 docker compose up -d 명령어로 한번에 3tier 이중화 구조의 컨테이너 생성 및 실행


### 2. Web 2개(apache), Was 2개(Tomcat), DB 1개 (mysql), 외부 LB와 내부 LB 1개씩(Nginx) 구조


### 3. Tomcat에서 War 파일 배포시 /usr/local/src/tomcat/webapps 밑에 war 파일을 배포 후 Tomcat을 재시작하고 접속하면 배포 완료.


### 4. !War 파일 배포시 Tomcat 서버와 버전 문제로 파일을 못 찾는 경우가 있으므로 War 파일을 만들기 전 Java와 Springbootframework 버전 꼭 확인 후 배포!
