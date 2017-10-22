FROM maven:3.5.0-alpine

COPY sleep.sh .

RUN chmod 777 sleep.sh

CMD ["./sleep.sh"]
