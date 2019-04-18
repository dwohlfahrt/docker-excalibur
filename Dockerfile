FROM python:3.7.2-slim

COPY requirements.txt /requirements.txt

ARG DEBIAN_FRONTEND=noninteractive
RUN /usr/bin/apt-get update \
 && /usr/bin/apt-get install --assume-yes ghostscript libglib2.0-0 libsm6 libxext6 libxrender1 \
 && /usr/local/bin/pip install --no-cache-dir --requirement /requirements.txt \
 && rm -rf /var/lib/apt/lists/*

ENV EXCALIBUR_HOME /excalibur
ADD excalibur.cfg /excalibur/excalibur.cfg

ENTRYPOINT ["/usr/local/bin/excalibur"]
CMD ["webserver"]
