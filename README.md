# Trabalho-container-Docker

## Projetando, implantando e gerenciando uma rede empresarial usando tecnologia Linux, com ênfase em serviços como DHCP, DNS e Firewall com Docker.

### Descrição do Trabalho:

- O trabalho tem como objetivo configurar um ambiente de rede em Docker para uma empresa fictícia. Este ambiente deve incluir serviços essenciais de rede, como DHCP, DNS e Firewall, para garantir conectividade e segurança adequadas. Cada serviço de ser configurado em um container Docker separado e garantir que eles se comuniquem adequadamente entre si. Além disso, é necessário criar Dockerfiles para cada imagem necessária, com base na imagem ubuntu:latest, e realizar testes para validar a configuração da rede.

### Tecnologias Utilizadas

- Docker

### Imagens Docker Utilizadas

- [Imagem Ubuntu](https://hub.docker.com/_/ubuntu)

### Funcionamento

Para que o usuário consiga rodar o projeto, ele deverá clonar este repositório em seu computador e ter instalado na sua máquina a seguinte ferramenta:

- Docker

- Utilizando-se da própria maquina host, inicia-se a criação de uma imagem através dos Dockerfiles localizados na pasta do projeto e a inicialização das imagens em um container.

### Topologias, Estruturas Utilizadas e Funcionamento dos Serviços

- O primeiro container docker que será criado é um container que proverá serviços DHCP. O container receberá um arquivo [dhcp.conf](./Config/dhcpd.conf) contendo as devidas configurações para o serviço. Também, o container será liberado a porta 67/udp e será por ela que o servidor DHCP atribuirá o ip para novas maquinas que aparecerem na rede.

- O segundo container irá iniciar um servidor DNS para resolver os nomes de dominio dentro da rede. Ao iniciar, ele estará com o arquivo de configuração [dhcp.conf](./Config/named.conf.options) que possuí as atribuições necessárias para realizar a resolução dos nomes na rede, liberando também a porta 53 tcp/udp.

- O terceiro container executara um servidor firewall que por sua vez através do script [firewall.sh](./Config/firewall.sh) realizará as configurações de firewall da rede, bloqueando o acesso de todas as portas e liberando somente para as de dhcp e dns liberadas nos containers anteriores.

### Testes e resultados

- Os serviços foram testados na seguinte sequência

  - DHCP
  - DNS
  - Firewall

- #### DHCP

  - Para testar o servidor DHCP podemos apenas adicionar um novo container à rede, assim esperamos que o nosso serviço implementado, através de um pedido feito pelo novo container forneça um novo ip à máquina.

    ![Teste DHCP](images/image.png)

- #### DNS

  - Para testar o serviço DNS você terá que acessar o bash dos containers de dhcp ou firewall e realizar o comando:

  ```shell
  dig www.example.com
  ```

  - E terá que receber como retorno o ip relacionado a esse endereço de dominio como mostrado na figura abaixo:

    ![Teste DNS](images/image2.png)

- #### Firewall

  - Para testar o serviço FTP, na sua máquina você deverá executar o seguinte comando no console

  ```shell
  ftp 192.168.56.2 21
  ```

  - Quando pedir usuário digite `kkazin` e a senha: `kkazin`. Se a conexão for estabelecida, você poderá utilizar o comando `put` para adicionar um arquivo e `get` para fazer o download deste arquivo.
    ![FTP Teste](images/image4.png)