
FROM debian:latest

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y \
	nasm:i386 valgrind gdb gcc 

RUN mkdir -p /workspace

WORKDIR /workspace

RUN rm -rf /var/lib/apt/lists/*


