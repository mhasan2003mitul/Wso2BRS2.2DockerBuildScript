FROM ubuntu

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \

    apt-get update && \ 
 
    apt-get install -y python-software-properties && apt-get install -y software-properties-common && apt-get install -y python3-software-properties && \

    add-apt-repository ppa:webupd8team/java && \

    apt-get update && \

    apt-get install -y oracle-java8-installer && \

    apt-get install -y wget && \
 
    apt-get install -y unzip && \
    
    mkdir -p /home/wso2 && \

    cd /home/wso2 && \

    wget --user-agent="testuser" http://product-dist.wso2.com/products/business-rules-server/2.2.0/wso2brs-2.2.0.zip && \

    unzip wso2brs-2.2.0.zip && \

    rm -rf wso2brs-2.2.0.zip && \

    mv wso2brs-2.2.0 wso2brs2.2

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $PATH:$JAVA_HOME/bin
ENV WSO2_BRS_HOME /home/wso2/wso2brs2.2
ENV PATH $PATH:$WSO2_BRS_HOME/bin

WORKDIR $WSO2_BRS_HOME

CMD wso2server.sh
