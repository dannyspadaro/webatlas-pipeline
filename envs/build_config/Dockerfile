FROM python:3.10-bookworm
ARG WEBATLAS_FORK_TAG="0.5.3-galaxy4"

COPY ./requirements.txt /requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/dannyspadaro/webatlas-pipeline/archive/refs/tags/${WEBATLAS_FORK_TAG}.tar.gz && \
    tar -xf ${WEBATLAS_FORK_TAG}.tar.gz && \
    mkdir -p /usr/local/bin/constants && \
    cp webatlas-pipeline-${WEBATLAS_FORK_TAG}/bin/build_config.py /usr/local/bin/build_config.py && \
    cp -r webatlas-pipeline-${WEBATLAS_FORK_TAG}/bin/constants/. /usr/local/bin/constants/ && \
    chmod +x /usr/local/bin/build_config.py && \
    rm -rf ${WEBATLAS_FORK_TAG}.tar.gz webatlas-pipeline-${WEBATLAS_FORK_TAG}

RUN pip install --upgrade pip --no-cache-dir && \
    pip install --no-cache-dir -r /requirements.txt
