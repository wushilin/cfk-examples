#!/bin/sh

for topic in `cat topics.txt`
do
	kafka-topics --delete --bootstrap-server xxx --topic "$topic"
done
