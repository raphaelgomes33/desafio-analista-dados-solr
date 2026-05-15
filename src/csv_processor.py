import re
import unicodedata
from datetime import datetime

import pandas as pd

from src.logger import logger


def normalizar_coluna(coluna: str) -> str:
    coluna = coluna.strip().lower()
    coluna = unicodedata.normalize("NFKD", coluna)
    coluna = coluna.encode("ascii", "ignore").decode("utf-8")
    coluna = re.sub(r"[^a-zA-Z0-9_]", "_", coluna)
    coluna = re.sub(r"_+", "_", coluna)
    return coluna.strip("_")


def limpar_texto(valor):
    if pd.isna(valor) or str(valor).strip() == "":
        return None

    return re.sub(r"\s+", " ", str(valor)).strip()


def formatar_data(valor):
    if pd.isna(valor) or str(valor).strip() == "":
        return None

    valor = str(valor).strip()

    formatos = [
        "%Y-%m-%d",
        "%d/%m/%Y",
        "%m/%d/%Y",
        "%Y-%m-%d %H:%M:%S",
    ]

    for fmt in formatos:
        try:
            return datetime.strptime(valor, fmt).strftime("%Y-%m-%dT%H:%M:%SZ")
        except ValueError:
            continue

    logger.warning(f"Data não reconhecida: '{valor}' — campo ignorado.")
    return None


def formatar_float(valor):
    if pd.isna(valor) or str(valor).strip() == "":
        return None

    try:
        return float(str(valor).replace(",", ".").strip())
    except ValueError:
        logger.warning(f"Valor numérico inválido: '{valor}' — campo ignorado.")
        return None


def formatar_int(valor):
    if pd.isna(valor) or str(valor).strip() == "":
        return None

    try:
        return int(float(str(valor).replace(",", ".").strip()))
    except ValueError:
        logger.warning(f"Valor inteiro inválido: '{valor}' — tratado como texto.")
        return limpar_texto(valor)


def ler_csv(caminho: str) -> pd.DataFrame:
    logger.info(f"Lendo arquivo CSV: {caminho}")

    try:
        df = pd.read_csv(caminho, encoding="utf-8")
    except UnicodeDecodeError:
        logger.warning("Falha ao ler como UTF-8. Tentando latin-1.")
        df = pd.read_csv(caminho, encoding="latin-1")

    logger.info(f"Total de registros lidos: {len(df)}")
    logger.info(f"Colunas originais: {list(df.columns)}")

    df.columns = [normalizar_coluna(col) for col in df.columns]

    logger.info(f"Colunas normalizadas: {list(df.columns)}")

    return df


def gerar_id(row, idx: int) -> str:
    if "matricula" in row and not pd.isna(row["matricula"]):
        return f"aluno_{str(row['matricula']).strip()}"

    nome = str(row.get("nome", "")).strip().lower()
    nascimento = str(row.get("data_de_nascimento", "")).strip()

    if nome and nascimento:
        nome = re.sub(r"[^a-z0-9]+", "_", nome)
        nascimento = re.sub(r"[^0-9]+", "", nascimento)
        return f"aluno_{nome}_{nascimento}"

    return f"aluno_{idx + 1}"



def formatar_csv(caminho: str) -> list[dict]:
    df = ler_csv(caminho)

    documentos = []

    for idx, row in df.iterrows():
        doc = {"id": gerar_id(row, idx)}

        for col in df.columns:
            if col == "id":
                continue

            valor = row[col]

            if "data" in col or "nascimento" in col or "criacao" in col:
                doc[col] = formatar_data(valor)

            elif "nota" in col or "media" in col:
                doc[col] = formatar_float(valor)

            elif col in ("idade", "serie", "matricula"):
                doc[col] = formatar_int(valor)

            else:
                doc[col] = limpar_texto(valor)

        doc = {campo: valor for campo, valor in doc.items() if valor is not None}
        documentos.append(doc)

    logger.info(f"Total de documentos formatados: {len(documentos)}")

    return documentos