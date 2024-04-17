from Director import Director
from ElectricCarBuilder import ElectricCarBuilder
from ClassicCarBuilder import ClassicCarBuilder
import time
import random

def simular_repostaje():
    coches_en_espera = 0
    espacios_carga = 8
    espacio_restante = 0

    while True:
        coches_en_espera += random.randint(0,3)
        print(f"Coches en espera {coches_en_espera}")
        coche_actual = random.choices([1, 2], weights=[1, 10])[0]
        if coche_actual==1:
            new_car = ElectricCarBuilder()
            director = Director(new_car)
            director.builder_car()
        elif coche_actual==2:
            new_car = ClassicCarBuilder()
            director = Director(new_car)
            director.builder_car()

        if new_car.car.fuel_type == "Electrico" and coches_en_espera > 0 :
            print(f"El coche es de tipo {new_car.car.fuel_type} por lo que su tiempo de carga es de {new_car.car.tiempo_recarga}")
            if espacio_restante < espacios_carga:
                print(f"¿Ponerlo a cargar?")
                respuesta = input("Ingrese 'si' para ponerlo a cargar: ")
                if respuesta.lower() == 'si':
                    espacio_restante += 1
                else:
                    print(f"Cliente descontento se va")
            else:
                print(f"No ha espacio para coches electricos")
                if random.randint(1,10) == 7:
                    espacio_restante -= 1
                    print(f"Un coche electrico acabó de cargar")
            coches_en_espera -= 1

        elif new_car.car.fuel_type == "Gasolina" and coches_en_espera > 0 :
            print(f"El coche es de tipo {new_car.car.fuel_type} por lo que su tiempo de repostaje es de {new_car.car.tiempo_recarga}")
            print(f"¿Echar gasolina?")
            respuesta = input("Ingrese 'si' para poner gasolina: ")
            if respuesta.lower() == 'si':
                time.sleep(15)
            else:
                print(f"Cliente descontento se va")
            coches_en_espera -= 1

if __name__ == "__main__":
    simular_repostaje()