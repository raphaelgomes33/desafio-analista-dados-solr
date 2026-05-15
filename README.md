# Desafio Técnico — Analista de Dados e Importação para o Solr

Pipeline completo de ingestão de dados CSV no Apache Solr com dashboard analítico em Power BI.

---

## Sumário

- [Requisitos](#requisitos)
- [Como executar](#como-executar)
- [Parte 1 — Dashboard Power BI](#parte-1--dashboard-power-bi)
- [Parte 2 — Importação para o Solr](#parte-2--importação-para-o-solr)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Configuração](#configuração)
- [Funcionalidades implementadas](#funcionalidades-implementadas)
- [Observações](#observações)

---

## Requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Python 3.10+
- Power BI Desktop

---

## Como executar

### Execução rápida

**Windows:**
```bash
run.bat
```

**Linux / macOS:**
```bash
chmod +x run.sh && ./run.sh
```

Os scripts sobem todos os containers (MySQL + Solr) e executam automaticamente a importação do CSV para o Solr 
e abrem o PowerBI com o Dashboard.

### Execução manual

Clone o repositório:

```bash
# SSH
git clone git@github.com:raphaelgomes33/desafio-analista-dados-solr.git

# HTTPS
git clone https://github.com/raphaelgomes33/desafio-analista-dados-solr.git
```

Suba os containers:

```bash
docker-compose up
```

Instale as dependências Python:

```bash
pip install -r requirements.txt
```

Configure o ambiente copiando o arquivo de exemplo:

```bash
cp .env.example .env
```

Execute o script de importação:

```bash
python app.py
```

---

## Parte 1 — Dashboard Power BI

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

```
desafio-analista-dados-solr/
│
├── app.py                  # Ponto de entrada do script
├── aluno.csv               # Arquivo CSV de entrada
├── docker-compose.yml      # MySQL + Solr
├── init.sql                # Schema e dados iniciais do MySQL
├── requirements.txt        # Dependências Python
├── run.bat                 # Script de execução (Windows)
├── run.sh                  # Script de execução (Linux/macOS)
├── .env.example            # Exemplo de configuração
├── .env                    # Arquivo de configuração
│
├── logs/
│   └── importar_solr.log   # Log de execução
│
├── powerbi/
│   └── dashboard_academico.pbix # Dashboard PowerBi
│
└── src/
    ├── config.py           # Carregamento de variáveis de ambiente
    ├── logger.py           # Configuração de logging
    ├── csv_processor.py    # Leitura e tratamento do CSV
    └── solr_service.py     # Conexão e inserção no Solr
```

---

## Configuração

Copie `.env.example` para `.env` e ajuste conforme necessário:

```env
SOLR_URL=http://localhost:8983/solr/alunos    #URL do core no Solr 
CSV_PATH=aluno.csv                            #Caminho para o arquivo CSV
BATCH_SIZE=50                                 #Quantidade de documentos por lote de inserção
LOG_FILE=logs/importar_solr.log               #Caminho do arquivo de log


Solr

# A interface administrativa do Solr pode ser acessada em:

http://localhost:8983/solr

# O core utilizado para importação é:

http://localhost:8983/solr/alunos

# ou com indentação (obs: mostra somente os 10 primeiros registros):

http://localhost:8983/solr/alunos/select?q=*:*&indent=true

# para mostrar 100% com indentação:

http://localhost:8983/solr/alunos/select?q=*:*&rows=100&indent=true
```

## Funcionalidades implementadas
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