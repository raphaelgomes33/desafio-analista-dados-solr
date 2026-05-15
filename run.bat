@echo off

if not exist ".env" (
    echo Criando arquivo .env a partir do .env.example...
    copy ".env.example" ".env"
)

echo Subindo ambiente Docker...
docker-compose up -d

echo.
echo Instalando dependencias Python...
pip install -r requirements.txt

echo.
echo Executando importacao para o Solr...
python app.py

echo.
echo Abrindo Solr...
start http://localhost:8983/solr

echo.
echo Abrindo dashboard Power BI...
start "" "powerbi\dashboard_academico.pbix"
echo Processo finalizado.


pause