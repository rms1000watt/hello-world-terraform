#cloud-config
package_upgrade: false
runcmd:
- echo "Hello World Ryan" > /tmp/ryan.txt
- echo "Region ${region}" >> /tmp/ryan.txt
- echo "VPC ID ${vpc_id}" >> /tmp/ryan.txt
