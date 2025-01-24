# Linux e Bash para enghenharia de dados

## Usando o Linux

Termos-chaves:


* Shell do linux: A interface de linha de comando do sistema linux

* Script em Bash: Scripts escritos em linguagem Bash shell do linux

* Shebang: A primeira linha de um script Bash que começa com #! indica ao interpretador a liguagem para executar o script. Por exemplo: "#!/bin/bash", "#!/bin/python3"

* Variável de ambiente: Variavel disponível globalmente para shells e processos. Usado para configurar o comportamento do shell linux.

* Alias: Um atalho que faz referência a um comando. Usado para reduzir a digitação de comandos usados com frequência.

Exemplos:

```
# Shebang indicating Bash interpreter
#!/bin/bash

# Print hello world
echo "Hello World"

# Set an environment variable
export MY_VAR="some value"

# Print the variable
echo $MY_VAR

# Define an alias
alias ll="ls -l"

# Use the alias
ll
```



### Comandos Shell:
Possuem a seguinte estrutura: "cmd -option target".
```
# Se eu for no terminal, entrar no diretorio /usr/bin e der ls -l eu consigo ver uma lista de todos os comandos possiveis
cd /usr/bin
ls -l
```

Alguns Comandos:
* uname -a : Mostra informações detalhadas sobre o kernel do sistema e o ambiente de operação linux;

* ls : retorna uma lista com todos os arquivos dentro de um diretório;

* pwd : abreviação para "Print Working Directory" que mostra todo o caminho até o diretório atual;

* wich "executavelFile": retorna a localização de um programa executável;

* touch NEWFILE.txt" : Comando touch cria um novo arquivo no diretório atual, o comando é seguido pelo nome do arquivo e o formato a ser criado;

* cat File.txt : Abreviação de concatenate, usado para imprimir o conteudo de arquivos, combinar arquivos e criar novos;

* ls -l file.sh: Abre uma lista de permissões de um arquivo;

* chmod +x file.sh": Altera as permissões de um arquivo para ser executável para todo tipo de usuario ou sistema;

* echo 'txt': Similar ao print do python(?), imprime algum texto no terminal. O que ecoa do comando pode ser usado em outros comandos;

* wc -l file: Conta o número de linhas em um arquivo;

* mkdir newdir": Cria um novo diretorio;

* mkdir -p /newdir/dir1/dir2": Cria diversos diretórios de uma única vez;

* mv file.txt newdir/: Move um arquivo para um diretório;

* rm -rf newdir: Deleta um diretorio ou arquivo.


### Shell Piping

**Piping:** Conectar a saída(stdout) de um comando com a entrada(stdin) de outro comando usando o símbolo pipe "|".
Ex: (ls -l | wc -l): Lista os arquivos e realiza um pipe com o comando wc.

**Redirecionamento:** Redireciona a saída de um comando para um arquivo ao invés da variável global de saída (stdout) ">".
Ex: (ls -l > output.txt):

**Execução condicional:** Encadeia comandos usando "&&" para executar o próximo comando somente se o primeiro for bem sucedido.
Ex: (ls file && echo "File exists").

**Append:** Adiciona um conteúdo ao final de um arquivo usando o comando ">>", sem sobrescrevê-lo.
Ex: ("Nova linha de texto" >> arquivo.txt)

**Caracteres de controle:** São caracteres especiais que geralmente não são vistos como texto comum, mas que desempenham funções especificas no fluxo de
entradas/saídas ou na manipução de dados. Segue alguns comandos:

 - Caractere de nova linha (\n): Quebra de linha;
 - Tabulação horizontal (\t): Insere um espaço de tabulação (4 ou 8 espaços);
 - Caractere de retorno (\r): Move o cursor para o inicio da linha sem avançar para uma nova linha (Similar a tecla HOME).
 - Backspace (\b): Essa é famosa e dispensa explicações (remove o último caractere).
 - Sinal de Alerta (\a): Emite um sinal de alerta (beeeeep) se o terminal suportar.
 - Caractere Nulo (\0): Representa o fim de uma string em muitas linguagens de programação.

**Dica:** O comando "cat -v arquivo.txt" exibe todos os caracteres de controle em um arquivo.

 ### SSH (Secure Shell)

  SSH (Secure Shell) é um protocolo de rede que permite a comunicação segura entre dois dispositivos conectados a uma rede, como a internet. Ele é amplamente utilizado para acessar e gerenciar remotamente servidores, dispositivos ou sistemas de maneira criptografada e segura.

Exemplos de comandos:

 * ssh-keygen: Comando gera um par de chaves para autentificação (Pública/ privada);

 * cat: Usado para printar o conteúdo de sua chave para conceder acesso ao github.

 * git clone: Clona um repositório do github  via SSH usando o par de chaves.

 * ssh - L: encaminha a porta 8080 no host remoto para a porta local 8080 para acesso remoto (A porta 8080 é uma porta não reservada, geralmente usada por aplicações ou servidores para estabelecer conexão local)

Criando uma chave SSH e usando com o github:
```
#Para criar um par de chaves SSH no ambiente linux que vc estiver usando, vc usa o comando: "" e cole a chave gerada na parte de Configurações > Chaves SSH e GPC(?):
ssh-keygen -t rsa
# Copie e cole a chave gerada na parte Configurações > Chaves SSH E GPC;
# Desta forma agora é possivel fazer download, cópias, uploads entre outras ações usando o link de repositório do github, como por exemplo: "https://github.com/splikNot/DataEngineering-Roadmap.git"
#Usando SSH a gente é capaz de rodar comandos em nossa maquina local(desktop) em uma maquina virtual na núvem (Servidor Remoto). (AWS/Codeppace)
```








