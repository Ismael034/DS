package src.Carrera;

import src.Bicicleta.BicicletaMontana;
import src.Bicicleta.BicicletaCarretera;
import src.Bicicleta.Bicicleta;

import java.util.ArrayList;

public abstract class Carrera {
    ArrayList<Bicicleta> bicicletas;

    public Carrera(ArrayList<Bicicleta> bicicletas) {
        this.bicicletas = bicicletas;
    }
    public void empezar(){
        // Lógica para la simulación de la carrera
        System.out.println("¡Comienza la carrera!");
        // Simulación de la carrera de 60 segundos
        try {
            Thread.sleep(60000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("¡Carrera finalizada!");

        // Retirar el 20% de las bicicletas de montaña y el 10% de las de carretera
        int retirarMontana = (int) (bicicletas.size() * 0.2);
        int retirarCarretera = (int) (bicicletas.size() * 0.1);

        for (int i = 0; i < retirarMontana; i++) {
            if (bicicletas.get(i) instanceof BicicletaMontana) {
                bicicletas.remove(i);
                i--;
            }
        }

        for (int i = 0; i < retirarCarretera; i++) {
            if (bicicletas.get(i) instanceof BicicletaCarretera) {
                bicicletas.remove(i);
                i--;
            }
        }
        System.out.println("Bicicletas restantes: " + bicicletas.size());
    }
}
