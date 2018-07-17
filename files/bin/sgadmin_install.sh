#!/bin/bash
/usr/share/elasticsearch/plugins/search-guard-6/tools/sgadmin.sh \
	-cd ../sgconfig/ \
	-ts ../sgconfig/truststore.jks \
	-tspass changeit \
	-ks ../sgconfig/kirk-keystore.jks  \
	-kspass changeit \
	-nhnv \
	-icl
