import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_mtu_to_kanaton.dart';
import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_kanaton_to_mtu.dart';
import 'package:conversor_unidades_gps_dyb/presentation/screen/converter/converter_gps_kanymtu.dart';
import "package:flutter/material.dart";


class ConverterFunctionScreen extends StatelessWidget {
  const ConverterFunctionScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('DYB conversor unidades GPS para AIS', style: TextStyle(color: Colors.white),),
          
          backgroundColor: Colors.blue,
        ),
      body: SizedBox(
        width: 500,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GPSaKanatonYMTU()));
            }, 
            child: const Text('Gmaps a MTU y Kanaton', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            const SizedBox(height: 20.0,),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GPSMTUaKanaton()));
            }, 
            child: const Text('MTU a Kanaton', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),)),
            const SizedBox(height: 20.0,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GPSKanatonaMTU()));
            }, 
            child: const Text('Kanaton a MTU', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),))
          ],
        )),
      ),
    );
    
  }

}


