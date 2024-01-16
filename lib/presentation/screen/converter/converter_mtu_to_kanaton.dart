import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_functions.dart';
//import 'package:ais_gps_format_converter/presentation/screen/converter/conveter_gps_kanymtu.dart';
import "package:flutter/material.dart";



// Convertir de MTU a Kanaton

class GPSMTUaKanaton extends StatefulWidget {
  const GPSMTUaKanaton({super.key});

  @override
  State<GPSMTUaKanaton> createState() => _GPSMTUaKanatonState();
}

class _GPSMTUaKanatonState extends State<GPSMTUaKanaton> {
  TextEditingController _coord1ControllerGrados = TextEditingController();
  TextEditingController _coord1ControllerMinutos = TextEditingController();
  TextEditingController _coord1ControllerSegundos = TextEditingController();
  TextEditingController _coord2ControllerGrados = TextEditingController();
  TextEditingController _coord2ControllerMinutos = TextEditingController();
  TextEditingController _coord2ControllerSegundos = TextEditingController();

  double latGmaps = 0;
  double lonGmaps = 0;
  String latMTU = '';
  String lonMTU = '';
  String latKan = '';
  String lonKan = '';
  String mensaje = '';
  int gradosLat = 0;
  double minutosLat = 0;
  double segundosLat = 0;
  int gradosLon = 0;
  double minutosLon = 0;
  double segundosLon = 0;
  String resultadoLatitud = '';
  String resultadoLongitud = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Coordenadas MTU a Kanaton', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // DATOS RECIBIDOS

          //Datos de latitud MTU
          const Text("Latitud de MTU ", style: TextStyle( fontSize: 16, fontWeight: FontWeight.w300 )),
          const SizedBox(height: 10.0,),
          TextField(
            controller: _coord1ControllerGrados,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: "Grados (°)", labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            controller: _coord1ControllerMinutos,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: "Minutos (')", labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            controller: _coord1ControllerSegundos,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: 'Segundos (")', labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),

          const SizedBox(height: 16.0,),

          //Datos de longitud MTU
          const Text("Longitud de MTU", style: TextStyle( fontSize: 16, fontWeight: FontWeight.w300 )),
          const SizedBox(height: 10.0,),
          TextField(
            controller: _coord2ControllerGrados,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: 'Grados (°)', labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),
          const SizedBox(height:10.0,),
          TextField(
            controller: _coord2ControllerMinutos,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: "Mintos (')", labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10.0,),
          TextField(
            controller: _coord2ControllerSegundos,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), labelText: 'Segundos (")', labelStyle: TextStyle(fontSize: 15), border: OutlineInputBorder()),
          ),


          //BOTON DE CONVERSIÓN

          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: (){
              setState((){ 

                try {
                  gradosLat = int.parse(_coord1ControllerGrados.text);
                  minutosLat = double.parse(_coord1ControllerMinutos.text);
                  segundosLat = double.parse(_coord1ControllerSegundos.text);
                  gradosLon = int.parse(_coord2ControllerGrados.text);
                  minutosLon = double.parse(_coord2ControllerMinutos.text);
                  segundosLon = double.parse(_coord2ControllerSegundos.text);
                  // if (0 > grados || grados <= 60 || minutos < 0 || minutos <= 60 || segundos < 0 ) {
                  //throw ArgumentError('Error, valores erroneos');
                  //}
                } catch (e) {
                  mensaje = 'Error de formato de unidades'; 
                }
                
              resultadoLatitud = convertirCoordenada(gradosLat, minutosLat, segundosLat);
              resultadoLongitud = convertirCoordenada(gradosLon, minutosLon, segundosLon);
              
            });           
            
            },
            
            // MUESTRA DE COORDENADAS

            child: 
            const Text("Transformar coordenadas")),
            const SizedBox(height: 20.0,),
            Text('Latitud Kanaton: $resultadoLatitud', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
            const SizedBox(height: 20.0,),
            Text('Longitud Kanaton: $resultadoLongitud', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
        
            const SizedBox(height: 30.0,),
            Text(mensaje, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red )),
            


        ],
      ),),
      
    );
    
  }
}