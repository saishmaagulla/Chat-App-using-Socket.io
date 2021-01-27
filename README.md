# Chat-App-using-Socket.io
A simple chat app using socket.io
  
See it in action - [Kunal Chat App](https://kunal-chat-app.herokuapp.com)

Run terraform as below

1. terraform plan

terraform plan -var-file variables.tfvars

2. terraform apply

terraform apply -var-file variables.tfvars

3. run ansible playbook 

ansible-playbook -i ansible/hosts ansible/deploy.yaml 

Note: Edit the IP address in the hostfile unde webserver group

4. variable files in terraform

terraform - variables.tfvars
