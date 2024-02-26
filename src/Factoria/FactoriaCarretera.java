package src.Factoria;

import src.Bicicleta.Bicicleta;
import src.Bicicleta.BicicletaMontana;
import src.Carrera.Carrera;
import src.Carrera.CarreraMontana;

import java.util.ArrayList;

public class FactoriaCarretera implements FactoriaCarreraBicicleta{
    @Override
    public Carrera crearCarrera(ArrayList<Bicicleta> bicicletas) {
        return new CarreraMontana();
    }

    @Override
    public Bicicleta crearBicicleta(int id_bicicleta) {
        return new BicicletaMontana(id_bicicleta);
    }
}
