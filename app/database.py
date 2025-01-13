#fazer a conexão com o database
import psycopg2


class Database:
    @staticmethod
    def create_connection():
        connection = psycopg2.connect(
            database='harry_potter_game',
            host='localhost',
            user='postgres',
            password='postgres',
            port=5432
        )
        return connection

    @staticmethod
    def create_character(connection, name):
        cursor = connection.cursor()
        query = f"INSERT INTO Personagem (vida, nivel, idarea, nome)values (100, 1, 2, '{name}')"
        cursor.execute(query)
        connection.commit()


def main():
    Database.create_connection()

if __name__ == '__main__':
    main()