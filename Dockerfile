FROM maven:latest

COPY sleep.sh .

RUN chmod 777 sleep.sh

CMD ["./sleep.sh"]
