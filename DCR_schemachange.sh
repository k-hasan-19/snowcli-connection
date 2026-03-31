#!/bin/bash
# Script used in github actions to run test the schemachange functionality 
touch ./connections.toml
echo [default] >> ./connections.toml
echo authenticator = \"snowflake_jwt\" >> ./connections.toml
echo account = \"${SNOWFLAKE_ACCOUNT}\" >> ./connections.toml
echo user = \"${SNOWFLAKE_USER}\" >> ./connections.toml
echo role = \"${SF_ROLE}\" >> ./connections.toml
echo warehouse = \"${SF_WAREHOUSE}\" >> ./connections.toml
echo database = \"${SF_DATABASE}\" >> ./connections.toml
echo schema = \"${SF_SCHEMA}\" >> ./connections.toml
echo private_key_file = \"./rsa_key.p8\" >> ./connections.toml
echo private_key_file_pwd = \"${PASSPHARSE}\" >> ./connections.toml 
echo "cat connections.toml"
cat ./connections.toml
echo "Current connections.toml"
ls -la ./connections.toml
echo "Changing owner and permissions to 666 for connections.toml"
sudo chmod 0600 ./connections.toml
sudo chown runner:runner ./connections.toml
ls -la ./connections.toml
pwd
#
