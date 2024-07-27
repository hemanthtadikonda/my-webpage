# Use the CentOS 7 base image
FROM centos:7
RUN  yum install epel-release -y

# Install Python3, pip, Development Tools, and other dependencies
RUN yum install -y python3 && \
    yum install -y python3-pip && \
    yum groupinstall -y "Development Tools" && \
    yum install -y epel-release && \
    yum install -y cmake3 && \
    yum install -y gcc-c++ make autoconf automake libtool zlib-devel libcurl-devel bzip2-devel openssl-devel xz-devel wget

# Install Streamlit
RUN pip3 install streamlit

RUN mkdir /app
WORKDIR /app
ADD ./ /app

ENTRYPOINT ["streamlit", "run", "app.py"]