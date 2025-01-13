#inicializar o jogo no terminal para o usuário
from database import Database
from classes import *
import sys
import os
import platform

def clear():
    system_name = platform.system().lower()
    if system_name == "windows":
        os.system("cls")
    else:
        os.system("clear")


class Game:
    def __init__(self):
        self.connection = Database.create_connection()
        self.player =  Character(-1, -1, -1, '', -1, -1)
        self.valid_cmd = 0
        pass

    def start(self):
        print(
            ' __   __  _______  ______    ______    __   __      _______  _______  _______  _______  _______  ______        __   __  __   __  ______')
        print(
            '|  | |  ||   _   ||    _ |  |    _ |  |  | |  |    |       ||       ||       ||       ||       ||    _ |      |  |_|  ||  | |  ||      |')
        print(
            '|  |_|  ||  |_|  ||   | ||  |   | ||  |  |_|  |    |    _  ||   _   ||_     _||_     _||    ___||   | ||      |       ||  | |  ||  _    |')
        print(
            '|       ||       ||   |_||_ |   |_||_ |       |    |   |_| ||  | |  |  |   |    |   |  |   |___ |   |_||_     |       ||  |_|  || | |   |')
        print(
            '|       ||       ||    __  ||    __  ||_     _|    |    ___||  |_|  |  |   |    |   |  |    ___||    __  |    |       ||       || |_|   |')
        print(
            '|   _   ||   _   ||   |  | ||   |  | |  |   |      |   |    |       |  |   |    |   |  |   |___ |   |  | |    | ||_|| ||       ||       |')
        print(
            '|__| |__||__| |__||___|  |_||___|  |_|  |___|      |___|    |_______|  |___|    |___|  |_______||___|  |_|    |_|   |_||_______||______|\n\n')

        option = 0
        while option !=3:
            print("Bem-vindo(a) ao jogo!\n")

            print('1 - Criar Novo Personagem\n' +
                  '2 - Carregar Personagem\n' +
                  '3 - Sair\n\n\n')

            print('Digite a opção desejada: \n')
            option = input()
            if option == '1':
                self.create_character()
            elif option == '2':
                self.load_character()
            elif option == '3':
                sys.exit()
            else:
                print('Opção inválida!\n')
                self.start()


    def create_character(self):
        clear()
        print('Digite o nome do seu personagem: ')
        name = input()
        self.player = Character(-1, 100, 1, name, 1, -1)
        if name == '':
            print('Nome inválido! O nome do personagem não pode ser vazio.\n')
            self.start()

        self.player = Database.create_character(self.connection, name)
        self.new_game()

    def load_character(self):
        clear()
        print('Digite o nome do seu personagem: ')
        name = input()
        self.player = Database.load_character(self.connection, name)
        if self.player.id_character == -1:
            print('Personagem não encontrado!\n')
        else:
            self.new_game()


    def new_game(self):
        print('SEJA BEM VINDO À HOGWARTS, VOCÊ SE ENCONTRA NO PORTÃO PRINCIPAL DA ESCOLA\n'
              'VOCÊ DEVE ESCOLHER PARA QUAL LADO IRÁ SEGUIR, NORTE, SUL, LESTE OU OESTE\n'
              'DIGITE A DIREÇÃO QUE DESEJA SEGUIR:\n'
              )
        #recuperar as regioes possiveis
        Database.get_areas(self.connection, self.player)

        direction = input()
        #fazer ele andar
        Database.change_area(self.connection, self.player, direction)



if __name__ == '__main__':
    game = Game()
    game.start()