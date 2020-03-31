## Sample UBI 8 Tornado Python web server 

# UBI 8 Standard image
FROM registry.access.redhat.com/ubi8/ubi

# Required Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels
LABEL name="ubi8-tornado" \
      vendor="pcsherid" \
      version="0.1.0" \
      release="1" \
      run='' \
      summary="UBI 8 Tornado server" \
      description="Tornado web server for UBI 8" \
      maintainer="pcsherid"

USER root

# Update base image
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum

# Install Python 3 & pip
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos python3 python3-pip -y && rm -rf /var/cache/yum
RUN pip3 install --upgrade pip

# Install Tornado
RUN pip3 install tornado

# Copy config and website files
COPY helloworld.py /usr/lib64/python3.6/site-packages/tornado/helloworld.py

# Expose port
EXPOSE 8888

# Start the service
CMD python3 /usr/lib64/python3.6/site-packages/tornado/helloworld.py

# Always include a software license in the default location
# Required for Red Hat container certification
COPY licenses/ /licenses
