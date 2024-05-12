
# GKE Autopilot   
Este projeto cria uma infraestrutura de Kubernetes no Google Cloud. 



## Bucket para o Terraform
Criar um bucket com nome **gke-bucket** no Cloud Storage para armazenar as variáveis de estado do Terraform.
Desta forma é mantido em nuvem quais recursos foram criados.

## Executar localmente  

Clone o projeto 

~~~bash  
  git clone https://github.com/devair/gke-autopilot.git
~~~

Acesse o diretório do projeto

~~~bash  
  cd gke-autopilot
~~~


Inicie o Terraform executando os seguintes comandos

~~~bash  
terraform init
~~~
~~~bash  
terraform plan
~~~
~~~bash  
terraform apply
~~~


## Destruir a infraestrutura (Importante)
Após concluir todos os trabalhos, caso deseje, execute o comando abaixo para destruir toda a infraestrutura criada por este projeto.

Essa ação impede que este projeto fique alocando na nuvem consumindo recursos e gerando cobrança desnecessariamente.

~~~bash  
terraform destroy
~~~
## Documentação de referência  
- [Autopilot overview](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)
- [Cloud SQL](https://cloud.google.com/sql?hl=pt-BR)  
