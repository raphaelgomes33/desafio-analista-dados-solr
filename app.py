from src.csv_processor import formatar_csv
from src.solr_service import inserir_solr
from src.logger import logger
from src.config import CSV_PATH


def main() -> None:
    logger.info("Iniciando processo de importação para o Solr.")

    documentos = formatar_csv(CSV_PATH)
    inserir_solr(documentos)

    logger.info("Processo finalizado com sucesso.")


if __name__ == "__main__":
    try:
        main()
    except Exception:
        logger.exception("Erro inesperado na execução da aplicação.")