####################################
# Team City 8 Agent Docker Image
# Tyler Power
# tylerpowerx@gmail.com
####################################

FROM ubuntu

ENV TEAM_CITY_BASE_URL http://download-ln.jetbrains.com/teamcity
ENV TEAM_CITY_PACKAGE TeamCity-8.0.2.tar.gz
ENV TEAM_CITY_INSTALL_DIR /usr/local

RUN apt-get install -y wget default-jre
RUN wget -P /tmp/ $TEAM_CITY_BASE_URL/$TEAM_CITY_PACKAGE
RUN tar xfz /tmp/$TEAM_CITY_PACKAGE -C $TEAM_CITY_INSTALL_DIR
RUN rm /tmp/$TEAM_CITY_PACKAGE

ADD https://github.com/Diggs/docker-teamcity-agent/blob/master/agent.sh $TEAM_CITY_INSTALL_DIR/TeamCity/

EXPOSE 9090
ENTRYPOINT .$TEAM_CITY_INSTALL_DIR/TeamCity/agent.sh run