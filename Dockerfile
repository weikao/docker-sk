# This is a comment
FROM ubuntu:14.04
#MAINTAINER Docker wkao <wkao@docker.com>
RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
#RUN wget https://down.ipyingshe.com/sk_linux_64 -P /bin
COPY sk_linux_64 /bin/sk_linux_64
RUN chmod +x /bin/sk_linux_64

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8
ARG token=default
ENV token ${token}

CMD ["sh", "-c", "/bin/sk_linux_64 -token=${token}"]
