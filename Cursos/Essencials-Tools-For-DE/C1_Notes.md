# Linux e Bash para engenharia de dados

## Usando o Linux

Termos-chaves:


* Shell do linux: A interface de linha de comando do sistema linux;

* Script em Bash: Scripts escritos em linguagem Bash shell do linux;

* Shebang: A primeira linha de um script Bash que começa com #! indica ao interpretador a liguagem para executar o script. Por exemplo: "#!/bin/bash", "#!/bin/python3";

* Variável de ambiente: Variavel disponível globalmente para shells e processos. Usado para configurar o comportamento do shell linux;

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

**Piping:** Conectar a saída(stdout) de um comando com a entrada(stdin) de outro comando usando o símbolo pipe "|";
Ex: (ls -l | wc -l) Lista os arquivos e realiza um pipe com o comando wc.

**Redirecionamento:** Redireciona a saída de um comando para um arquivo ao invés da variável global de saída (stdout) ">";
Ex: (ls -l > output.txt)

**Execução condicional:** Encadeia comandos usando "&&" para executar o próximo comando somente se o primeiro for bem sucedido;
Ex: (ls file && echo "File exists")

**Append:** Adiciona um conteúdo ao final de um arquivo usando o comando ">>", sem sobrescrevê-lo;
Ex: ("Nova linha de texto" >> arquivo.txt)

**Caracteres de controle:** São caracteres especiais que geralmente não são vistos como texto comum, mas que desempenham funções especificas no fluxo de
entradas/saídas ou na manipução de dados. Segue alguns comandos:

 - Caractere de nova linha (\n): Quebra de linha;
 - Tabulação horizontal (\t): Insere um espaço de tabulação (4 ou 8 espaços);
 - Caractere de retorno (\r): Move o cursor para o inicio da linha sem avançar para uma nova linha (Similar a tecla HOME);
 - Backspace (\b): Essa é famosa e dispensa explicações (remove o último caractere);
 - Sinal de Alerta (\a): Emite um sinal de alerta (beeeeep) se o terminal suportar;
 - Caractere Nulo (\0): Representa o fim de uma string em muitas linguagens de programação;

**Dica:** O comando "cat -v arquivo.txt" exibe todos os caracteres de controle em um arquivo.

 ### SSH (Secure Shell)

  SSH (Secure Shell) é um protocolo de rede que permite a comunicação segura entre dois dispositivos conectados a uma rede, como a internet. Ele é amplamente utilizado para acessar e gerenciar remotamente servidores, dispositivos ou sistemas de maneira criptografada e segura.

Exemplos de comandos:

 * ssh-keygen: Comando gera um par de chaves para autentificação (Pública/ privada);

 * cat: Usado para printar o conteúdo de sua chave para conceder acesso ao github;

 * git clone: Clona um repositório do github  via SSH usando o par de chaves;

 * ssh - L: encaminha a porta 8080 no host remoto para a porta local 8080 para acesso remoto (A porta 8080 é uma porta não reservada, geralmente usada por aplicações ou servidores para estabelecer conexão local);

Criando uma chave SSH e usando com o github:
```
#Para criar um par de chaves SSH no ambiente linux que vc estiver usando, vc usa o comando: "" e cole a chave gerada na parte de Configurações > Chaves SSH e GPC(?):
ssh-keygen -t rsa
# Copie e cole a chave gerada na parte Configurações > Chaves SSH E GPC;
# Desta forma agora é possivel fazer download, cópias, uploads entre outras ações usando o link de repositório do github, como por exemplo: "https://github.com/splikNot/DataEngineering-Roadmap.git"
#Usando SSH a gente é capaz de rodar comandos em nossa maquina local(desktop) em uma maquina virtual na núvem (Servidor Remoto). (AWS/Codeppace)
```


## Configurando Shell

  A configuração do shell ocorre com a alteração do arquivo /.bashrc, nele podemos adicionar alias(atalhos), exportar variáveis ambientes, criar um ambiente virtual automaticamente na hora de execuração. Basicamente podemos colocar tudo que queiramos automatizar nesse arquivo, desta forma o shell automaticamente realiza algumas ações ao ser iniciado.

* alias: Funciona como um atalho para comandos e caminhos de arquivos. É como se fosse uma função variável que retorna um comando especifico ou arquivo para que possamos encurtar atividades repetitivas;

* source: Carrega e executa um script ou arquivo no shell atual;
       
* export: Determina uma váriavel ambiente para que possa ser usada por processos filhos. É como se dessemos um escopo global a uma váriavel;

* Ambiente Virtual: Um ambiente isolado em python, como se fosse uma máquiva virtual (porém é somente um ambiente shell separado, não uma virtual machine em sí) somente com python separada de todo sistema para que vc possa trabalhar sem alterar o seu sistema principal, ou para que vc possa trabalhar com versões diferentes do python;

* Plugin: Ferramentas adicionais que aumentam ou melhoram as funcionalidades do nosso Shell (Como o zshrc que eu quase apaguei sem querer ontem).

```
# Alias example
alias documents="cd ~/Documents"
documents           # Changes to Documents directory

 # Source example
source ~/.bashrc    # Reloads bash config

# Export example
export API_KEY="123abc"
python script.py    # script.py can access $API_KEY

# Virtual environment
python3 -m venv my_env
source my_env/bin/activate # Activates the environment

 # Plugin
source ~/.zshrc # Reloads zsh config with plugins

```


### Variáveis em Shell

* Variável do Shell: Variável que existe apenas dentro do Shell e armazena dados para serem usados nos scripts ou outros processos;
```
# Shell Variable
food="apple"
echo $food
```

* export: Comando que permite uma variável do shell ser acessada por por Shells/Processos filhos;
```
# Export for child process access
export food="apple"
bash
echo $food
```

* source: Executa um script no shell atual, desta forma, qualquer variável/atalho se tornarão disponiveis no ambiente atual;
```
# Source to load current environment
source ./script.sh
echo $food
```

* Processos pais/filhos: Processos pais iniciam outros processos. Processos filhos herdam variáveis e permissões dos processos pais;
```
# Parent/Child Processes
export food="apple"
bash
echo "In child - $food"
```

* Python: É possivel usar váriaveis passadas globalmente através do export para ser usadas com outras linguagens, como python através da biblioteca OS;
```
# Access shell variable in Python
import os
print(os.environ['food'])
```

### Fluxos Padrão
  Fluxo que segue segue os dados. A entrada de um comando (**stdin**), a saída da informação após esse comando (**stdout**) e os erros de fluxo, que na metáfora do encanamento do fluxo de dados, seria algum bloqueio na tubulação;
```
# Example capturing output of ls command to output.txt file
        ls -l /home > output.txt
```

**Standard input** (**stdin**): Dados que são inseridos no programa ou fluxo. Geralmente por entrada do usuário ou piping de outro processos;
```
# Example reading user input into variable
read -p "Enter file name: " filename
echo "You entered: $filename"
```

**Standard output** (**stdout**): É o destino da informação após um processo, se ele vai pra outro processo através de um piping, se vai ser escrito em um arquivo ou ser exibido no terminal;
```
# Example piping echo output to sort and unique
echo -e "apple\nbanana\napple" | sort | uniq -c
```

**Standard error** (**stderr**): Onde a saída de um erro é exibida (lembrando que não necessariamente estamos falando da exibição no terminal, mas sim, onde a informação de um erro é armazenada);
Uma coisa interessante para trabalhar com erros é poder envia-los para outro lugar.
```
# Example redirecting errors from invalid command to errors.txt
ls -l invalid 2>> errors.txt
ls -l /var/FAKEDIR 2> /dev/null
```

**Piping**: Justamente como a metafora da tubulação, piping é conectar o stdout de um processo para o stdin de outro, desta forma criando um fluxo nesta tubulação.
E é basicamente a forma de se trabalhar mais eficiente em bash.
```
# Chaining grep, sort and uniq commands
ps -ef | grep python | sort | uniq -c
```


## Lógica do Shell e controle de fluxo

**Controle de fluxo:** Ordem em que cada declaração e comandos são executados em um programa. Geralmente são operações do tipo loop, logica condicional, etc.
    É interessante nesses exemplos olhar a sintaxe usada para declarar loops e etc. Bash estranhamente não usa simbolos para operadores lógicos, deve ser por que eles usam pra realizar comandos. O que é engraçado. Desciobri na base da dor que operadores lógicos precisam ir dentro de parenteses duplos, como no looping abaixo:
```
# Vou inserir o looping feito em um dos meus scripts
```

**Lógica condicional:**  Dispensa comentários sobre estrutura condicionais. Apenas preciso me atentar à sintaxe das estruturas. (if, else, etc);
```
# If-else example
if [ $myvar -gt 10 ]; then
    echo "myvar is greater than 10"
else
    echo "myvar is 10 or less"
fi
```

**Loops:** Estruturas de repetição. (while, for);
```
# For loop
for i in {1..10}; do
    echo "Welcome $i times"
done
```

**Operadores Lógicos:** (And, Or, etc) GPT deu uma aula completa de operadores lógicos, revisar depois;
```
# And logical example
if [ $x -gt 2 ] && [ $y -lt 10 ]; then
    echo "x meets both conditions"
fi
```


## Manipulando dados com shell

* Truncamento: Reduz o tamanho de um arquivo com comandos como head e tail;
```
# Truncate - Get first 5 lines
head -n 5 file.txt
# Truncate - Get last line
tail -n 1 file.txt
```

* Filtrar: Procurar por padrões em um ARQUIVO. (grep);
```
# Filter - Get lines with "error"
grep "error" file.log
```

* Cortar: Extrai uma coluna de um arquivo. (cut);
```
# Cut - Get 2nd column from file
cut -f2 file.csv
```

* Encontrar: Procura por ARQUIVOS/PASTAS recursivamente. (find);
```
# Find - Find files named "data.csv"
find . -name "data.csv"
```

* Localizar: Procura os arquivos de acordo com PALAVRAS no seu nome, e não no nome exato. (locate).
```
# Locate - Find files containing "stats"
locate "*stats*"
```



## Scripts em Bash e CLI:

As três principais coisas na estrutura de um script são: *Shebang*, *debug mode* e *declarações e variáveis*.
**Declarações:** Um comando individual executado no shell. (grep, ls, rm). Declarações são *efêmeros* (transitórios);
```
# Grep statement searches for a pattern in a file
grep "localhost" /etc/hosts
```

**Script:** Arquivo contendo uma sequência declarações em shell e lógica para automatizar processos. Geralmente são arquivos executaveis to tipo ".sh", mas também pdem ser do tipo ".py";
```
#!/bin/bash

# Backup script archives a directory
tar -cvzf /backups/documents.tar.gz /documents
```

**Função:** Operação que pode ser reutilizada diversas vezes para executar uma tarefa. Uma função só precisa ser declarada uma vez, dessa forma facilitando seu uso posterior no programa. (Ela precisa ser carregada no ambiente através de um source);
```
backup_docs(){
    tar -cvzf /backups/documents.tar.gz /documents
}
# Call the backup function
backup_docs
```

**CLI (Command Line Interface):** Um script que aceita inputs, como flags ou argumentos para controlar seu comportamento;
Parece um pouco com a forma de orientação objeto no python. Vc define uma função principal e coloca uns métodos personalizados à essa sua ferramenta.
```
#!/bin/bash
# CLI tool to print a phrase multiple times
times=$1   #Declaração dos argumentos 
phrase=$2    #Na ordem em que são passados

for ((i=0; i<$times; i++)); do
    echo $phrase
done
```

**Array:** Estrutura de dados que organiza seus dados armazenados em indexes de valores inteiros;
```
files=(/etc/hosts /etc/profile /etc/bashrc)

for file in "${files[@]}"; do
    ls -l "$file"
done
```

**Debug mode:** Os comandos abaixo podem ser executados quando chamados na linha de código.Mas, também podem ser ativados no inicio do script, no Shebang: #!/usr/bin/bash -xv (Ativa o modo verbose e debbug).
* set -e: Coloca em modo estrito, executa um exit no shell quando um comando falha;
* set -v: Coloca o Shell em modo verbose, ou seja. Ele irá printar cada linha do script antes de executa-la. Muito importante para depuração e entender o que está acontecendo;
* set -x: Coloca o Shell em modo debug. Neste modo ele irá atuar semelhante ao modo verbose. Só que ao invés exibir as linhas do scripts exatamente como estão no arquivo. Ele irá executar as variáveis ou substituições e etc.


## Procurando no sistema de arquivos.
* locate: comando para encontrar rapidamente um arquivo em especifico através de um banco de dados ao invés do próprio sistema de arquivo. Mais rápido consultar um banco de dados com as estruturas dos diretórios do que sair buscando recursivamente em cada pasta;
```
# locate command searches file index quickly
locate recipes.txt
```

* find: Procuram pelo sistema de arquivos para encontrar os arquivos que correspondem aos critérios passados na busca. Mais lento do que usar locate;
```
# find searches live, takes longer
find . -name recipes.txt
```
* updateDB: Comando que atualiza o banco de dados para incluir arquivos mais recentes na busca usando locale;
```
# Must updateDB first to get latest files
sudo updatedb
locate new-doc.txt
```

* xargs: Direciona (pipes) diversas entradas para um mesmo comando. No contexto de busca, ele nos permite realizar alguma ação com diversos arquivos encontrados no comando find de uma só vez.
```
# Find and delete with xargs
find . -name 'temp*' -print | xargs rm
```


## Modificando Arquivos, Diretórios, Permissões e arquivamento.
Alguns comandos vão se repetir, mas é interessante coloca-los nesse contexto.

* mkdir: Cria uma nova pasta (Diretório pra ficar bonito);
```
# Make a directory
mkdir NovaPasta
```

* touch: Cria um novo arquivo vázio;
```
# Touch a file
touch file.txt
```

* mv: Move um arquivo ou diretório;
```
# Move a file
mv file.txt /tmp/file.txt
```
* cp: Copia um arquivo ou diretório;
```
# Copy a directory recursively
cp -r mydir /backup/mydir
```
* rsync: Sincroniza os arquivos entre diretórios;
```
# Synchronize directories
rsync -av /source/dir /dest/dir
```

* chmod: Altera as permissôes de um arquivo;
```
# Set permissions to read/write for owner only
chmod 600 file.txt
```
* zip: Coloca os arquivos em uma pasta zipada.
```
# Create a zip archive
zip -r archive.zip /files/to/compress
```


## Processando Texto:
* regex: regex é muito bom porque a gente consegue usar para pesquisa de padrões variados de texto ou arquivo e funciona perfeitamente com os comandos do bash. Vc pode usar tanto em arquivos quando diretórios; (Eu preciso fazer um revisão de regex).

* grep: Procura por padrões no texto e retorna as linhas onde foi encontrado;
```
# grep to search for "text" in files
grep "text" file.txt
```

* cut: Remove/corta seções de cada linha em uma arquivo;
```
# cut to extract first 3 columns
cut -f1-3 file.txt
```
* sort: Organiza as linhas de um arquivo de acordo com o critério passado.;
```
# sort to sort contents of file
sort file.txt
```

* uniq: Reporta ou filtra linhas repetidas em um arquivo;
```
# uniq to filter duplicate lines
uniq file.txt
```

* awk:  Padrão de escaneamento e processamento da linguagem(?);
```
# awk to print lines with more than 2 columns
awk '{if(NF>2) print $0}' file.txt
```

* diff: Mostra a diferença entre dois arquivos;

* shuf: Pega amostras aleatórias de um arquivo (man shuf para ver mais funcionalidades;

* sed: Substitui uma palavra ou padrão por outro;

(Vou fazer um completasso de funções e comandos para manipulação de texto)

    











