# Projeto Prático de Kubernetes (App Base)

Este repositório contém os arquivos de um exercício prático voltado para o aprendizado e configuração de **Kubernetes**. O sistema consiste em uma aplicação simples com Frontend (HTML/JS), Backend (PHP) e Banco de Dados (MySQL).

⚠️ **Aviso:** Este projeto tem fins puramente educacionais e acadêmicos, sendo utilizado como parte de um curso de Kubernetes. As configurações aplicadas aqui focam em rodar a aplicação localmente (usando o Minikube, por exemplo) e não devem ser replicadas diretamente em ambientes de Produção (Production) sem os devidos ajustes de segurança e arquitetura.

## 🛠️ Tecnologias Envolvidas
* **Docker:** Utilizado para empacotar o backend em PHP e o banco de dados MySQL em contêineres independentes.
* **Kubernetes (Minikube):** Responsável pela orquestração dos contêineres, gestão de serviços (ClusterIP, LoadBalancer) e persistência de dados (PersistentVolumeClaim).
* **PHP & MySQL:** Linguagem de processamento e banco de dados relacional que validam a persistência e interconexão no cluster.
* **HTML/JS/CSS:** Formulário interativo (Frontend) fazendo requisições AJAX para o servidor PHP.

## 📁 Estrutura do Repositório
- `frontend/`: Arquivos estáticos do site (HTML, CSS e JavaScript).
- `backend/`: Código-fonte PHP usado como API para processar e salvar os dados via banco e o seu respectivo `Dockerfile`.
- `database/`: Arquivo de dump de banco (`sql.sql`) de inicialização e o seu `Dockerfile`.
- `deployment.yml`: Arquivo declarativo com as diretrizes de implantação (*Deployments*) e volume persistente (*PVC*).
- `services.yml`: Arquivo com a definição das políticas de rede do Kubernetes (*Services*).
- `script.sh`: Script automatizado para configurar o ambiente do Minikube, realizar o *build* (construção) das imagens localmente e aplicar os arquivos YAML no cluster.

## 🚀 Como testar localmente
1. Certifique-se de ter o `minikube` e o `kubectl` instalados e em execução.
2. Execute o arquivo `./script.sh` para iniciar a criação e deploy.
3. Para conectar o frontend ao backend, habilite o tráfego do serviço executando:
   ```bash
   kubectl port-forward service/php 8080:80 --address 0.0.0.0 &
   ```
4. Suba um servidor web na pasta `/frontend` para acessar a interface visual (exemplo: `python3 -m http.server 8081`).
