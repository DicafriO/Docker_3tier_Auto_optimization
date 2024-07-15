FROM ubuntu:22.04

ENV LC_ALL=ko_KR.utf8\
    domain=khlee0328.shop\
    external_lb_address=nginx1\
    internal_lb_address=nginx2\
    web_address1=apache1\
    web_address2=apache2\
    was_address1=tomcat1\
    was_address2=tomcat2\
    db_address=db1\
    db_username=khl\
    db_password=0328\
    tomcat_version=apache-tomcat-9.0.90\
    mysql_connector_version=8.4.0\
    username=root password=0000

# 비대화형 방식으로 수행하도록 설정(설치 중간에 사용자 입력을 요구하지 않도록)
ARG DEBIAN_FRONTEND=noninteractive

#/etc/apt/sources.list 파일에서 기본적으로 설정된 Ubuntu 패키지 미러 서버 주소를 
#kr.archive.ubuntu.com에서 mirror.kakao.com으로 변경합니다. 
#이렇게 설정하면 패키지 설치 속도를 더 빠르게 할 수 있습니다.
RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# -qq 옵션은 super quiet 모드로 로그를 띄우지 않는 모드임 (에러 로그같은 중요한 로그만 출력)
# -y 는 install 시 (y/n) 으로 물어보면 무조건 y 로 대답하는 옵션
# noninteractive 와 -y 둘 다 사용하는 이유는 -y는 apt 에서만 동작하기 때문
# 완전한 비대화형 방식을 사용하기 위해 둘 다 사용
RUN apt update && apt install -qq -y systemd systemd-sysv init\
               && apt install -qq -y build-essential\
               && apt install -qq -y tzdata locales\
               && apt install -qq -y openssh-server\
               && apt install -qq -y vim curl gettext\
               && systemctl mask getty@tty1.service\
               && systemctl disable getty@tty1.service\
               &&locale-gen ko_KR.utf8\
               && mkdir /var/run/sshd\
               && apt-get clean autoclean\
               && apt-get -y autoremove\
               && rm -rf /var/lib/{apt, dpkg, cache, log}

#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
#    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
    
EXPOSE 22
CMD ["/lib/systemd/systemd"]