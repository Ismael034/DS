package src.Factoria;

import src.Bicicleta.Bicicleta;
import src.Carrera.Carrera;

import java.util.ArrayList;

public interface FactoriaCarreraBicicleta {
    public Carrera crearCarrera(ArrayList<Bicicleta> bicicletas);
    public Bicicleta crearBicicleta(int id_bicicleta);
}
