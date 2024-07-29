FROM debian:bullseye

#Install mariadb
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install vim -y
RUN apt-get install curl -y

#Replace config file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#Expose port 3306
EXPOSE 3306

#Run the lauch script
COPY tools/configure.sh /tmp/configure.sh
RUN chmod +x /tmp/configure.sh
ENTRYPOINT ["sh", "/tmp/configure.sh"]
CMD ["mariadbd"]
#CMD ["tail", "-f"]
