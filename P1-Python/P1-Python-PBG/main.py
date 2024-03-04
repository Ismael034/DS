
import threading
from FactoriaCarretera import FactoriaCarretera
from FactoriaMontana import FactoriaMontana

def main():
    factoria = FactoriaCarretera()
    carreraCarretera = factoria.crearCarrera(5)

    factoria = FactoriaMontana()
    carreraMontana = factoria.crearCarrera(5)

    # Crear dos hebras
    hebra1 = threading.Thread(target=carreraCarretera.iniciar)
    hebra2 = threading.Thread(target=carreraMontana.iniciar)

    # Iniciar las hebras
    hebra1.start()
    hebra2.start()

    # Esperar a que ambas hebras terminen
    hebra1.join()
    hebra2.join()

if __name__ == '__main__':
    main()