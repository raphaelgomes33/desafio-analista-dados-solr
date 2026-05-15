# Desafio Técnico - Analista de Dados e Importação para o Solr

## Requisitos

- Docker Desktop
- Python 3.10+
- Power BI Desktop

---

# Como executar o projeto

## Execução Rápida

1. Certifique-se de que o Docker Desktop e o Power BI Desktop estejam instalados.
2. Execute:

```bash
run.bat

3. Se estiver em ambiente linux/mac será necessario abrir o terminal e digitar ou colar:

chmod +x run.sh
./run.sh
```


## Execução Manual

Clone o repositório:

```bash
git clone git@github.com:raphaelgomes33/desafio-analista-dados-solr.git (Via ssh)
```
ou 

```bash
git clone https://github.com/raphaelgomes33/desafio-analista-dados-solr.git (via https)
```

Suba os containers:

docker-compose up


## Parte 1 - Dashboard Power BI

O dashboard foi desenvolvido utilizando Power BI com foco em análise acadêmica e demográfica dos alunos.

Estrutura do Dashboard

O dashboard foi dividido em 3 páginas:

# 1. Demografia dos Alunos
Distribuição por gênero
Distribuição por bairro
Distribuição de idade
Filtros interativos

# 2. Desempenho Acadêmico
Média de notas por semestre
KPIs de desempenho
Tabela dinâmica com alunos e médias
Filtros interativos

# 3. Matérias e Professores
Média por matéria
Informações sobre professores
KPIs
Tabela com matérias e descrição
Recursos utilizados
Medidas DAX
Relacionamentos entre tabelas
Navegação entre páginas
Interatividade entre visuais
Filtros dinâmicos
Arquivo Power BI

O arquivo .pbix está disponível na pasta:

/powerbi


## Parte 2 - Importação de Dados para o Solr

Foi desenvolvido um script em Python responsável por:

Ler o arquivo CSV
Tratar inconsistências
Normalizar colunas
Formatar dados
Inserir documentos no Apache Solr

# Tecnologias utilizadas
pandas
pysolr
python-dotenv

# Estrutura do Projeto

project/
│
├── app.py
├── requirements.txt
├── .env
│
├── logs/
│   └── importar_solr.log
│
├── powerbi/
│   └── dashboard_academico.pbix
│
└── src/
    ├── config.py
    ├── logger.py
    ├── csv_processor.py
    └── solr_service.py

# Instalação das dependências
pip install -r requirements.txt

# Executando o script
python app.py
Configuração

As configurações da aplicação estão no arquivo .env.

Exemplo:

SOLR_URL=http://localhost:8983/solr/alunos/
CSV_PATH=aluno.csv
BATCH_SIZE=50
LOG_FILE=logs/importar_solr.log

Solr

A interface administrativa do Solr pode ser acessada em:

http://localhost:8983/solr

O core utilizado para importação é:

http://localhost:8983/solr/alunos

ou com indentação (obs: mostra somente os 10 primeiros registros):

http://localhost:8983/solr/alunos/select?q=*:*&indent=true


para mostrar 100% com indentação

http://localhost:8983/solr/alunos/select?q=*:*&rows=100&indent=true

# Funcionalidades implementadas
Tratamento de encoding UTF-8 e latin-1
Normalização de colunas
Conversão de datas
Conversão numérica
Tratamento de valores inválidos
Inserção em lote
Logs da aplicação
Tratamento de exceções
Logs

Os logs da execução são gerados em:

/logs/importar_solr.log



## Observações

- O ambiente Docker deve estar em execução antes de executar o script Python.
- O dashboard Power BI foi desenvolvido utilizando os dados disponibilizados no ambiente do desafio.
- O script de importação realiza limpeza e normalização dos dados antes da inserção no Apache Solr.

---

## Autor

Raphael Gomes Pinto