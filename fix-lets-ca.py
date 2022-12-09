import os

os.system("rpm -qa | grep ca-certificates-2021.2.50-72.el7_9.noarch || yum update -y  ca-certificates || update-ca-trust")
