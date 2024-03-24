# Ejercicio 2. Patrón Factoría Abstracta + Patrón Prototipo


Programa utilizando hebras la simulación de 2 carreras simultáneas con el mismo número
inicial (N) de bicicletas. N no se conoce hasta que comienza la carrera. De las carreras de
montaña y carretera se retirarán el 20 % y el 10 % de las bicicletas, respectivamente, antes
Práctica P1. Uso de patrones de diseño creacionales y estructurales en OO 8
de terminar. Ambas carreras duran exactamente 60 s. y todas las bicicletas se retiran a la
misma vez.

Deberán seguirse las siguientes especificaciones:
- Se implementará el patrón de diseño Factoría Abstracta junto con el patrón de diseño
Método Factoría.
- Se usará Java como lenguaje de programación.
- Se utilizarán hebras tanto para las carreras como para las bicicletas.
- Se implementarán las modalidades montaña/carretera como las dos familias/estilos de
productos1
- Se definirá la interfaz Java FactoriaCarreraYBicicleta para declarar los métodos de fabricación públicos:
    - crearCarrera que devuelve un objeto de alguna subclase de la clase abstracta Carrera y 
    - crearBicicleta que devuelve un objeto de alguna subclase de la clase abstracta Bicicleta.
- La clase Carrera tendrá al menos un atributo ArrayList<Bicicleta>, con las bicicletas
que participan en la carrera. La clase Bicicleta tendrá al menos un identificador único
de la bicicleta en una carrera. Las clases factoría específicas heredarán de FactoriaCarreraYBicicleta y cada una de ellas se especializará en un tipo de carreras y
bicicletas: las carreras y bicicletas de montaña y las carreras y bicicletas de carretera. Por consiguiente, tendremos dos clases factoría específicas: FactoriaMontana y
FactoriaCarretera, que implementarán cada una de ellas los métodos de fabricación
crearCarrera y crearBicicleta.
- Se definirán las clases Bicicleta y Carrera como clases abstractas que se especializarán en clases concretas para que la factoría de montaña pueda crear productos
BicicletaMontana y CarreraMontana y la factoría de carretera pueda crear productos
BicicletaCarretera y CarreraCarretera.

Se elegirá el lenguaje de programación Python o Ruby. Para simplificar: no es necesario
el uso de hebras.

---

Para ejecutar

```
cd src/
python3 main.py
```