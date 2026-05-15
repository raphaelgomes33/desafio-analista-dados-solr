import pysolr

from src.config import SOLR_URL, BATCH_SIZE
from src.logger import logger


def conectar_solr() -> pysolr.Solr:
    logger.info(f"Conectando ao Solr: {SOLR_URL}")

    solr = pysolr.Solr(
        SOLR_URL,
        always_commit=True,
        timeout=10
    )

    logger.info("Cliente Solr configurado.")

    return solr


def inserir_solr(documentos: list[dict]) -> None:
    if not documentos:
        logger.warning("Nenhum documento para inserir.")
        return

    solr = conectar_solr()
    

    total = len(documentos)
    inseridos = 0
    falhas = 0

    for inicio in range(0, total, BATCH_SIZE):
        fim = inicio + BATCH_SIZE
        lote = documentos[inicio:fim]

        try:
            solr.add(lote)
            inseridos += len(lote)
            logger.info(f"Inseridos {inseridos}/{total} documentos.")
        except Exception:
            falhas += len(lote)
            logger.exception(f"Erro ao inserir lote {inicio}-{fim}.")


    logger.info(
        f"Importação concluída. Inseridos: {inseridos}. Falhas: {falhas}. Total: {total}."
    )