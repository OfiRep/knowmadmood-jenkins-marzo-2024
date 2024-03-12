#!/bin/bash

# CloudBees CSRF Explained
# => https://support.cloudbees.com/hc/en-us/articles/219257077-CSRF-Protection-Explained
# How to install Jenkins Plugins via the API
# => https://stackoverflow.com/questions/9765728/how-to-install-plugins-in-jenkins-with-the-help-of-jenkins-remote-access-api
# => https://gist.github.com/basmussen/8182784
# Using Jenkins' Crumb
# => https://gist.github.com/dasgoll/455522f09cb963872f64e23bb58804b2

# Using a mixture of Shell and Python.
#mytoken=$(curl --user 'username:password' -s https://jenkins/crumbIssuer/api/json | python -c 'import sys,json;j=json.load(sys.stdin);print j["crumbRequestField"] + "=" + j["crumb"]')

# First get our CSRF Protection Crumb from Jenkins
curl --verbose --location --insecure \
  --user 'admin':'admin' \
  --url 'http://localhost:8081/crumbIssuer/api/json'
# The Crumb should either be in the format of
#     --header ".crumb:uniquestringidentifer"
# or
#     --header "Jenkins-Crumb:uniquestringidentifer"

# Now we pass Jenkins our Crumb identifier.
#curl --verbose --locaiton --insecure \
#  --request POST \
#  --header "" \
#  --user '':'' \
#  --url ''

# Install specific versions of plugins via the REST API. For some reason, not
# Groovy, which is super annoying because everything else is in Groovy.
# => https://gist.github.com/basmussen/8182784
curl --verbose --location --insecure \
  --request POST \
  --user 'admin':'admin' \
  --header 'Content-Type: text/xml' \
  --header 'Jenkins-Crumb:uniquestringidentifer' \
  --header 'crumb:7f79862edb411cc33365a7a2b2a951d6bbdcf9912e5763e3ba11ba9630c962c5' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --url 'http://localhost:8081/job/maikelalonsobana-zip-file/buildWithParameters?token=mySecretPassword&PARAMETERS_IN_BASE64=cHJ1ZWJhY2FkZW5hZW5iYXNlNjQ=&decodedOriginFile=cHJ1ZWJhY2FkZW5hZW5iYXNlNjQ=&decodedDestinationFile=cHJ1ZWJhY2FkZW5hZW5iYXNlNjQ=&decodedCpuCores=cHJ1ZWJhY2FkZW5hZW5iYXNlNjQ=&COMPRESSION_LEVEL=VWx0cmE='
# => https://gist.github.com/basmussen/8182784#gistcomment-2734311
# Supposedly you don't need to do this anymore?