#!/usr/bin/env bash

# Update repository to fetch latest OpenJDK
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update

# Install required packages
sudo apt-get -y install openjdk-8-jdk maven

# Build the Gateway application
cd /vagrant/jobmanager
mvn clean package

# Updating hosts
echo "192.168.23.24  jobdb.dev" >> /etc/hosts
echo "192.168.33.12  kafka.dev" >> /etc/hosts

# Run the Gateway application
java -jar target/piazza-jobmanager*.jar