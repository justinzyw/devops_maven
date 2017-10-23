FROM maven:3.5.0-alpine

COPY sleep.sh .

RUN chmod 777 sleep.sh

VOLUME /root/.m2/

CMD ["./sleep.sh"]
