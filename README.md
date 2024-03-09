# Ejercicio 5 (opt) +1 punto
Diseño de una aplicación de WebScraping en Python donde se utilice el Patrón Strategy para scrapear información en vivo de acciones en la página web https://finance.yahoo.com/quote/, donde se puede añadir el sufijo de la acción para acceder a información en vivo de ésta. 

Ejemplo con TESLA: https://finance.yahoo.com/quote/TSLA.
Para el Patrón Strategy se usarán 2 estrategias:
- BeautifulSoup
- Selenium

Se desea scrapear de la página anterior los siguientes elementos:
- Precio de cierre anterior
- Precio de apertura,
- Volumen
- Capitalización de mercado.

Toda esta información se guardará en un fichero .json, de forma que cada vez que se
ejecute el código se borre el contenido anterior y se mostrará el nuevo.
Se valorará estilo, calidad e implementación del código.

---
Para ejecutar la práctica
```
pip3 install -r requirements.txt
python3 main.py
```
