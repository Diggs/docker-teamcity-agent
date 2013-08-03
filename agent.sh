#!/bin/bash

AGENT_CONFIG=$TEAM_CITY_INSTALL_DIR/TeamCity/buildAgent/conf/buildAgent.properties

sed -i.bak "s@serverUrl=http://localhost:8111/@serverUrl=$1@g" $AGENT_CONFIG
sed -i.bak "s@ownPort=9090@ownPort=$2@g" $AGENT_CONFIG
sed -i.bak "s@#ownAddress=<own IP address or server-accessible domain name>@ownAddress=$3@g" $AGENT_CONFIG
sed -i.bak "s@name=Default Agent@name=$4@g" $AGENT_CONFIG

.$TEAM_CITY_INSTALL_DIR/TeamCity/buildAgent/bin/agent.sh run