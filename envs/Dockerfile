FROM python:3.10-bookworm
ARG BIOFORMATS2RAW="0.7.0"
ARG WEBATLAS_FORK_TAG="0.5.3-galaxy1"

COPY ./requirements.txt /requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      wget zip unzip cmake g++ ant procps libblosc1 libvips libtiff-tools openjdk-17-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget -q -O bioformats2raw.zip https://github.com/glencoesoftware/bioformats2raw/releases/download/v${BIOFORMATS2RAW}/bioformats2raw-${BIOFORMATS2RAW}.zip && \
    unzip bioformats2raw.zip -d /usr/local/share/ && \
    ln -sf /usr/local/share/bioformats2raw-${BIOFORMATS2RAW}/bin/bioformats2raw /usr/local/bin/bioformats2raw && \
    rm -rf bioformats2raw.zip
RUN wget https://github.com/dannyspadaro/webatlas-pipeline/archive/refs/tags/${WEBATLAS_FORK_TAG}.tar.gz && \
    tar -xf ${WEBATLAS_FORK_TAG}.tar.gz && \
    cp -r webatlas-pipeline-${WEBATLAS_FORK_TAG}/bin/* /usr/local/bin/ && \
    chmod +x /usr/local/bin/* && \
    rm -rf webatlas-pipeline-${WEBATLAS_FORK_TAG}.tar.gz webatlas-pipeline-${WEBATLAS_FORK_TAG}
RUN pip install --upgrade pip "setuptools<81" distlib --no-cache-dir && \
    pip install --no-cache-dir -r /requirements.txt

ENTRYPOINT []
