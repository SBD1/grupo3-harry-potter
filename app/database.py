#fazer a conexão com o database
import psycopg2
from classes import *


@staticmethod
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

    @staticmethod
    def load_character(connection, name) -> Character:
        cursor = connection.cursor()
        query = f"SELECT * FROM Personagem WHERE nome = '{name}'"
        cursor.execute(query)
        character = cursor.fetchone()
        player = Character(*character, *(0, ) * (6 - len(character)))
        if character:
            return player
        else:
            return -1

    @staticmethod
    def change_area(connection, player, direction):
        cursor = connection.cursor()
        #tenho que mudar a area que o personagem está
        query = (f"""ALTER TABLE Personagem
                     UPDATE idArea = (SELECT area{direction} FROM Area WHERE idArea = {player.id_area})
                     WHERE idPersonagem = {player.id_character};
                  """)

    @staticmethod
    def get_areas(connection, player):
        pass


def main():
    Database.create_connection()

if __name__ == '__main__':
    main()