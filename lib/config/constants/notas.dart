// // VARIABLES DE ENTORNO

// 1. import 'package:flutter/material.dart';

// primero creo un archivo llamado .env donde coloco mis api key o claves 
// 2. segundo creo un env.template para escribir las variables que se necesitan pero sin poner los api key 
// es solo para mostrar un template de ejemplo para otros desarrolladores 
// 3. al principio de mi gitignore pongo .env para no subir a git ese archivo 
// 4. realizo un archivo readme con las instrucciones para crear el .env y llenar esas variables de entorno 
// 5. subo a git  

// 6. instalo la dependecia flutter_dotenv 
// 7. convierto el main en future void y luego dentro llamo a dotenv para leer en cualquier parte de la app estas variables 
// asi: 

// Future<void> main() async {
//   await dotenv.load(fileName: '.env');
//   runApp(const MainApp());
// }

// 8. creo una carrpeta llamada constants y una clase llamada environment 
// donde creo como statics una varuiable que contenga el dotenv de la variable de entorno 
// a ustilizar
// 9. llamo a esaas variables como Environment.theMovieDb 


// LLAMADAS HTTP

// En mi carpeta infrastructure es donde hago mis llamdas http 

// creo la clase referente al llamado MoviedbDatasource y hago que extienda de MoviesDatasource 
// por lo que podre acceder a los metodos del datasource


//MAPPERS

// Creo una entidad cuyo objetivo sera mappear la respuesta http

