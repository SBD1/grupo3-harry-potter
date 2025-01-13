#definir as classes

class Character: #definição da classe de Personagens
        def __init__(self, id_character, life, level, name, id_area, idHouse):
            self.id_character = id_character
            self.life = life
            self.level = level
            self.name = name
            self.id_area = id_area
            self.idHouse = idHouse


class Area: #definição da classe de Áreas do Mapa
        def __init__(self, id_area, name, description, north_area, south_area, west_area, east_area):
            self.id_area = id_area
            self.name = name
            self.description = description
            self.north_area = north_area
            self.south_area = south_area
            self.west_area = west_area
            self.east_area = east_area
