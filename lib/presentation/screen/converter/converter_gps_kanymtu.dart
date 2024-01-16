import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_functions.dart';
//import 'package:ais_gps_format_converter/presentation/screen/converter/conveter_gps_kanymtu.dart';
import "package:flutter/material.dart";


//CONVERTIR DE GPS a MTU Y KANATON


class GPSaKanatonYMTU extends StatefulWidget {
  const GPSaKanatonYMTU({super.key});

  @override
  State<GPSaKanatonYMTU> createState() => _GPSaKanatonYMTUState();
}

class _GPSaKanatonYMTUState extends State<GPSaKanatonYMTU> {
  final TextEditingController _coord1Controller = TextEditingController();
  final TextEditingController _coord2Controller = TextEditingController();

  double latGmaps = 0;
  double lonGmaps = 0;
  String latMTU = '';
  String lonMTU = '';
  String latKan = '';
  String lonKan = '';
  String mensaje = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('GPS a Kanaton y MTU', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _coord1Controller,
            decoration: const InputDecoration(labelText: 'Ingresar latitud', labelStyle: TextStyle(fontSize: 20), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16.0,),
          TextField(
            controller: _coord2Controller,
            decoration: const InputDecoration(labelText: 'Ingresar longitud', labelStyle: TextStyle(fontSize: 20), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: (){
              setState((){ 
                
                //LATITUD MTU
                try {
                  latGmaps = double.parse(_coord1Controller.text);
                  mensaje = '';
                } catch (e) {
                  mensaje = 'Error de formato de unidades'; 
                }

                

                //LONGITUD MTU
                
                try {
                  lonGmaps = double.parse(_coord2Controller.text);
                  mensaje = ''; 
                } catch (e) {
                  mensaje = 'Error de formato de unidades'; 
                }

                latMTU = convertirLatitudMTU(latGmaps);
                lonMTU = convertirLongitudMTU(lonGmaps);
                latKan = convertirLatitudKAN(latGmaps);
                lonKan = convertirLongitudKAN(lonGmaps);
                 //Este método es para refrescar o rehacer el widget.
              
              
            });
              

            }, child: 
            const Text("Transformar coordenadas")),
            const SizedBox(height: 20.0,),
            Text('Latitud MTU AIS-C: $latMTU', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
            const SizedBox(height: 20.0,),
            Text('Longitud MTU AIS-C: $lonMTU', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
            
            const SizedBox(height: 20.0,),
            Text('Latitud Kanaton: $latKan', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
            const SizedBox(height: 20.0,),
            Text('Longitud Kanaton: $lonKan', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),

            const SizedBox(height: 30.0,),
            Container(
              
              child: Text(mensaje, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red))
              ),
            


        ],
      ),),
      
    );
    
  }
}
