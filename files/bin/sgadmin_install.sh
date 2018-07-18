#!/bin/bash
/usr/share/elasticsearch/plugins/search-guard-6/tools/sgadmin.sh \
	-cd /etc/elasticsearch/instance1/sgconfig/ \
	-ts /etc/elasticsearch/instance1/sgconfig/truststore.jks \
	-tspass changeit \
	-ks /etc/elasticsearch/instance1/sgconfig/kirk-keystore.jks  \
	-kspass changeit \
	-nhnv \
	-icl
