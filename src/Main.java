package src;

import src.Carrera.Carrera;
import src.Factoria.FactoriaCarreraBicicleta;
import src.Factoria.FactoriaCarretera;
import src.Factoria.FactoriaMontana;

public class Main {

    public static void main(String[] args) {
        int n_bicicletas = 100;

        FactoriaCarreraBicicleta factoria_montana = new FactoriaMontana();
        Carrera carrera_montana = factoria_montana.crearCarrera(n_bicicletas);

        FactoriaCarreraBicicleta factoria_carretera = new FactoriaCarretera();
        Carrera carrera_carretera = factoria_carretera.crearCarrera(n_bicicletas);

        Thread hilo_montana = new Thread(carrera_montana::empezar);
        Thread hilo_carretera = new Thread(carrera_carretera::empezar);

        // Iniciar las hebras
        hilo_montana.start();
        hilo_carretera.start();
    }
}
