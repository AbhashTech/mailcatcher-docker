FROM alpine
LABEL maintainer="kunal@ikunal.in" \
    org.label-schema.name="mailcatcher" \
    org.label-schema.vendor="AbhashTech" \
    org.label-schema.description="MailCatcher a Fake SMTP Server for testing email. It catched email and display in a web interface." \
    org.label-schema.version="${MAILCATCHER_VERSION}"

ENV VERSION=0.7.1

RUN apk --no-cache --update add g++ make ruby ruby-dev ruby-json ruby-etc sqlite-dev \
&& gem install mailcatcher:${VERSION} --no-document \
&& apk del g++ make

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["mailcatcher", "-f", "--ip", "0.0.0.0"]