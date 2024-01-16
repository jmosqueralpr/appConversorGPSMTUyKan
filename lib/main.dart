//import 'package:ais_gps_format_converter/presentation/screen/converter/conveter_gps_kanymtu.dart';
import 'package:flutter/material.dart';
import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_function_screen.dart';

void main () {
  runApp( const MyApp() );  //Esto es fundamental para lanzar mi app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //Este es el key de my widget MyApp. super.key es la inicialización de la llave para mi StatelessWidget MyApp.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //ESTO BÁSICAMENTE ES MI APLICACIÓN, MI PRIMER WIDGET.
      debugShowCheckedModeBanner: false, //Para quitar la etiqueta del modo de desarrollo.   
      theme: ThemeData(
        useMaterial3: true,   //Para definir que vamos a usar los Widget de Material3
        colorSchemeSeed: Colors.blue   //Estas son paletas de colores predefinidos para nuestra app.
      ),
      home: const ConverterFunctionScreen() //Acá estoy llamando mi widget de Counter Functions Screen (Que sería el fondo)
    );
  } //StatelessWidget viene del paquete de materials

}

