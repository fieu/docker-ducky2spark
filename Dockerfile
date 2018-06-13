FROM anapsix/alpine-java:8u172b11_jdk

VOLUME ["./" "/app"]

RUN apk add --update \
	python \
	git \
	wget \
	&& rm -rf /var/cache/apk/*

WORKDIR /app

RUN mkdir /app-tools/

WORKDIR /app-tools/

RUN git clone https://github.com/mame82/duck2spark.git duck2spark

RUN wget -O /app-tools/encoder.jar "https://github.com/hak5darren/USB-Rubber-Ducky/blob/master/Encoder/encoder.jar?raw=true"

CMD java -jar /app-tools/encoder.jar -i /app/script.txt -o /app/raw.bin -l ${KB_TYPE} && \
    python /app-tools/duck2spark/duck2spark.py -i /app/raw.bin -l 1 -f 1000 -o /app/sketch.ino && \
    echo "Converted ducky script to Arduino sketch code using the $KB_TYPE keyboard layout."