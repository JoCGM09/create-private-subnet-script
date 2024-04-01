FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl ca-certificates
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN ibmcloud plugin install power-iaas
COPY create-private-subnet.sh /app/
WORKDIR /app
RUN chmod +x create-private-subnet.sh 
CMD ["sh", "-c", "./create-private-subnet.sh"]