import os
from dotenv import load_dotenv


load_dotenv()


SOLR_URL = os.getenv("SOLR_URL", "http://localhost:8983/solr")
CSV_PATH = os.getenv("CSV_PATH", "aluno.csv")
BATCH_SIZE = int(os.getenv("BATCH_SIZE", "50"))
LOG_FILE = os.getenv("LOG_FILE", "logs/importar_solr.log")