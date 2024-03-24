
FROM ubuntu:latest

RUN apt-get update && apt-get upgrade && \
	apt-get install -y git make gcc && \
	git clone https://github.com/Smafl/philosophers.git

WORKDIR /philosophers

RUN make

CMD ["./philo", "300", "2000", "150", "150"]