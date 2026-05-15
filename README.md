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

Os scripts sobem todos os containers (MySQL + Solr) e executam automaticamente a importação do CSV para o Solr.

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

O dashboard foi desenvolvido com foco em análise acadêmica e demográfica, conectando-se diretamente ao banco MySQL provisionado pelo Docker.

### Páginas do dashboard

**1. Demografia dos Alunos**
- Distribuição por gênero (gráfico de pizza)
- Distribuição por bairro (gráfico de barras)
- Distribuição de idade (gráfico de barras empilhadas)
- Filtros interativos por gênero e bairro

**2. Desempenho Acadêmico**
- Média de notas por semestre (gráfico de linhas/barras)
- KPIs de desempenho geral
- Tabela dinâmica com alunos e médias individuais
- Filtros interativos por semestre, gênero e bairro

**3. Matérias e Professores**
- Média de notas por matéria
- Informações sobre professores responsáveis
- Tabela com matérias e descrições

### Recursos utilizados
- Medidas calculadas com DAX
- Relacionamentos entre as tabelas Alunos, Matérias e Notas
- Hierarquias para análise temporal
- Navegação entre páginas e interatividade entre visuais

O arquivo `.pbix` está disponível em `powerbi/dashboard_academico.pbix`.

---

## Parte 2 — Importação para o Solr

Script Python modular que lê o CSV de alunos, trata inconsistências e insere os documentos no Apache Solr em lotes.

### Tratamento de dados

O script lida com situações não ideais comuns em conjuntos de dados reais:

| Situação | Tratamento |
|---|---|
| Campos em branco ou nulos | Removidos do documento (valor `None`) |
| Espaços extras em texto | Normalizados com `re.sub` |
| Datas em múltiplos formatos (`dd/mm/yyyy`, `yyyy-mm-dd`, etc.) | Convertidas para o padrão ISO 8601 do Solr (`yyyy-MM-ddTHH:mm:ssZ`) |
| Valores numéricos com vírgula decimal | Convertidos para `float` com tratamento de erro |
| Nomes de colunas com acentos ou espaços | Normalizados para `snake_case` sem acentos |
| Erros em lotes de inserção | Capturados por `try/except` sem interromper os demais lotes |
| Erros inesperados na execução | Capturados no `main()` com stack trace registrado em log |

### Logs

Toda a execução é registrada em `logs/importar_solr.log`:

```
INFO  - Iniciando processo de importação para o Solr.
INFO  - Conectando ao Solr: http://localhost:8983/solr/alunos
INFO  - Inseridos 50/200 documentos.
INFO  - Inseridos 100/200 documentos.
...
INFO  - Importação concluída. Inseridos: 200. Falhas: 0. Total: 200.
```

### Verificando os dados no Solr

Interface administrativa:
```
http://localhost:8983/solr
```

Consultar todos os documentos importados:
```
http://localhost:8983/solr/alunos/select?q=*:*&indent=true
```

### Tecnologias utilizadas

| Biblioteca | Uso |
|---|---|
| `pandas` | Leitura e processamento do CSV |
| `pysolr` | Integração com o Apache Solr |
| `python-dotenv` | Gerenciamento de variáveis de ambiente |

---

## Estrutura do Projeto

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
│
├── logs/
│   └── importar_solr.log   # Log de execução
│
├── powerbi/
│   └── dashboard_academico.pbix
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
SOLR_URL=http://localhost:8983/solr/alunos
CSV_PATH=aluno.csv
BATCH_SIZE=50
LOG_FILE=logs/importar_solr.log
```

| Variável | Descrição |
|---|---|
| `SOLR_URL` | URL do core no Solr |
| `CSV_PATH` | Caminho para o arquivo CSV |
| `BATCH_SIZE` | Quantidade de documentos por lote de inserção |
| `LOG_FILE` | Caminho do arquivo de log |


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