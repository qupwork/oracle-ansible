#!/bin/bash

cd oracle-ansible
git pull

ansible-playbook -i ../inventory.yaml cleanup_containers_playbook.yaml --extra-vars "container_registry_username=adnn.selimovic@gmail.com autonomous_database_tag=v0.0.1 weblogic_server_tag=v0.0.1 weblogic_username=hello weblogic_password=123456789"

ansible-playbook -i ../inventory.yaml build_deploy_containers_playbook.yaml --extra-vars "weblogic_username=hello weblogic_password=123456789 autonomous_database_tag=v0.0.1 weblogic_server_tag=v0.0.1"

