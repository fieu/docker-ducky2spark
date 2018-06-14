FROM alpine:3.7

LABEL maintainer="Sheldon Rupp <me@shel.io>"

RUN apk add --no-cache --update \
	python \
	git

WORKDIR /app

RUN mkdir /app-tools/

WORKDIR /app-tools/

RUN git clone https://github.com/mame82/duck2spark.git duck2spark

RUN git clone https://github.com/mame82/duckencoder.py duckencoder.py

CMD python /app-tools/duckencoder.py/duckencoder.py -i /app/script.txt -o /app/raw.bin -l ${KB_TYPE} && \
    if [ -f /app/sketch.ino ]; then echo 'Removing old sketch.ino...' && rm -rf /app/sketch.ino; fi && \
    python /app-tools/duck2spark/duck2spark.py -i /app/raw.bin -l 1 -f 1000 -o /app/sketch.ino && \
    rm -rf /app/raw.bin && \
    echo "Converted ducky script to Arduino sketch code using the $KB_TYPE keyboard layout."