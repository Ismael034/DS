package src.Factoria;

import src.Bicicleta.Bicicleta;
import src.Bicicleta.BicicletaMontana;
import src.Carrera.Carrera;
import src.Carrera.CarreraMontana;

public class FactoriaCarretera implements FactoriaCarreraBicicleta{
    @Override
    public Carrera crearCarrera(int n_bicicletas) {
        return new CarreraMontana(bicicletas);
    }

    @Override
    public Bicicleta crearBicicleta(int id_bicicleta) {
        return new BicicletaMontana(id_bicicleta);
    }

}
