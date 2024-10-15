import sqlite3
import logging

from typing import NoReturn

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()],
)

database_name = "database.db"


def execute_sql_query(database: str, query: str) -> NoReturn:
    """Executes a SQL query in a given database.

    Args:
        database: Path to sqlite database file.
        query: SQL query to execute.
    """
    try:
        connection: sqlite3.Connection = sqlite3.connect(database)
        cursor: sqlite3.Cursor = connection.cursor()

        sql_statements = query.split(";")
        for statement in sql_statements:
            if statement.strip():
                cursor.execute(statement)
                logging.info(f"Executed query: {statement}")

        connection.commit()
        logging.info("SQL queries successfully executed.")
    except sqlite3.Error as error:
        logging.error(error)
    finally:
        if connection:
            connection.close()
            logging.info("Connection to SQLite closed.")


def read_sql_file(file_path: str = "data_sqlite.sql") -> str:
    """Reads the contents of a file named data.sql.

    Returns:
        str: Sql query."""
    try:
        with open(file_path, "r") as file:
            sql = file.read()
        logging.info(f"Successfully read SQL file: {file_path}")
        return sql
    except FileNotFoundError as e:
        logging.error(f"File not found: {file_path} - {e}")
        return ""


def main():
    sql = read_sql_file("data_sqlite.sql")
    if sql:
        execute_sql_query(database_name, sql)


if __name__ == "__main__":
    main()
