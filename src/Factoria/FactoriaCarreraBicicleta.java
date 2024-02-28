package src.Factoria;

import src.Bicicleta.Bicicleta;
import src.Carrera.Carrera;


public interface FactoriaCarreraBicicleta {
    public Carrera crearCarrera(int n_bicicletas);
    public Bicicleta crearBicicleta(int id_bicicleta);
}
