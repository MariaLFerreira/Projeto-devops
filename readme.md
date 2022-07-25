# Projeto Devops
### Configuração de um cluster k8s.


## Ferramentas que utilizei:

- Docker
- Ansible
- Terraform
- Drone CI
- AWS
- Kubernetes

## Como funciona?

- O Terraform cria as 2 instâncias da AWS, um grupo de segurança e faz o link com o backend para preservar o estado da infraestrutura.
- O Ansible instala e configura o Kubernetes.
- Eles trabalham juntos em um pipeline Drone CI.
- O Drone CI usa um contêiner do Docker que criei com o Terraform e o Ansible lá.

## Qual objetivo? 

O objetivo é apenas configurar um cluster Kubernetes em 2 instâncias da AWS, utilizando as principais ferramentas de devops. 