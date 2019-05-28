FROM alpine:3.9

LABEL maintainer="elisiano@gmail.com"

ADD tmux.conf /root/.tmux.conf

RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && apk -Uuv add --no-cache \
        bash \
        bash-completion \
        bash-doc \
        coreutils \
        curl \
        gawk \
        groff \
        jq \
        less \
        less-doc \
        man \
        man-pages \
        mariadb-client \
        mdocml-apropos \
        netcat-openbsd \
        openssh \
        openssl \
        py-pip \
        python \
        sed \
        socat \
        tmux \
        tree \
        vim \
        wget \
    && pip install awscli \
    && ln -s /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh \
    && sed -i s,root:x:0:0:root:/root:.*,root:x:0:0:root:/root:/bin/bash, /etc/passwd

ENV PAGER=less MANPAGER="less -Rr" USER=root SHELL=/bin/bash

CMD [ "/bin/bash", "-i", "-l" ]

