#!/bin/bash

if [ ! -f ".env" ]; then
    echo "Criando arquivo .env a partir do .env.example..."
    cp .env.example .env
fi

echo "Subindo ambiente Docker..."
docker-compose up -d

echo
echo "Instalando dependências Python..."
pip install -r requirements.txt

echo
echo "Executando importação para o Solr..."
python app.py

echo
echo "Abrindo dashboard Power BI..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open powerbi/dashboard_academico.pbix
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open powerbi/dashboard_academico.pbix
fi

echo

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open http://localhost:8983/solr
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:8983/solr
fi
echo "Processo finalizado."
