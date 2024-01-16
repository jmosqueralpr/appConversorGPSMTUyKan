//FUNCIONES PARA GPS A MTU Y KANATON

//FUNCIÓN PARA CONVERTIR UNIDADES DE LATITUD PARA MTU

String convertirLatitudMTU(double latitud) {
  bool esNegativo = latitud < 0;
  latitud = esNegativo ? -latitud : latitud;

  int grados = latitud.floor();
  double minutosDecimal = (latitud - grados) * 60;
  int minutos = minutosDecimal.floor();
  double segundos = (minutosDecimal - minutos) * 60;

  String direccion = esNegativo ? 'S' : 'N';

  return '$grados° $minutos\' ${segundos.toStringAsFixed(3)}" $direccion';
}

// FUNCIÓN PARA CONVERTIR UNIDADES DE LONGITUD PARA MTU

String convertirLongitudMTU(double longitud) {
  bool esNegativo = longitud < 0;
  longitud = esNegativo ? -longitud : longitud;

  int grados = longitud ~/ 1;
  int minutos = ((longitud - grados) * 60).toInt();
  double segundos = ((longitud * 3600) - (grados * 3600) - (minutos * 60)).toDouble();

  String direccion = esNegativo ? 'O' : 'E';

  return '$grados° $minutos\' ${segundos.toStringAsFixed(3)}" $direccion';
}

// FUNCIÓN PARA CONVERTIR UNIDADES DE LATITUD PARA KANATON

String convertirLatitudKAN(double latitud) {

  bool esNegativo = latitud < 0;
  latitud = esNegativo ? -latitud : latitud;

  int grados = latitud.floor();
  double minutosDecimal = (latitud - grados) * 60;
  String minutos = minutosDecimal.toStringAsFixed(4);

  String direccion = esNegativo ? 'S' : 'N';

  return '$grados° $minutos $direccion';
}


// FUNCIÓN PARA CONVERTIR UNIDADES DE LONGITUD PARA KANATON

String convertirLongitudKAN(double longitud) {
  
  bool esNegativo = longitud < 0;
  longitud = esNegativo ? -longitud : longitud;

  int grados = longitud.floor();
  double minutosDecimal = (longitud - grados) * 60;
  String minutos = minutosDecimal.toStringAsFixed(4);

  String direccion = esNegativo ? 'S' : 'N';

  return '$grados° $minutos $direccion';
}

// Funcion Conversor MTU a Kanaton

String convertirCoordenada(int grados, double minutos, double segundos) {
   // Convertir a minutos decimales
  double minutosDecimales = minutos + (segundos / 60.0);

  // Formatear la coordenada en grados y minutos
  String coordenadaFormateada = '$grados° ${minutosDecimales.toStringAsFixed(4)}\'';

  return coordenadaFormateada;
}

// Funcion Conversor Kanaton to MTU

String convertirCoordenadasKaM(double grados, double minutos) {
  // Obtener la parte entera de los grados
  int gradosConvertidos = grados.toInt();

  // Calcular los minutos totales
  double minutosTotales = minutos + (grados - gradosConvertidos) * 60;

  // Obtener la parte entera de los minutos
  int minutosConvertidos = minutosTotales.toInt();

  // Calcular los segundos restantes
  double segundosConvertidos = (minutosTotales - minutosConvertidos) * 60;

  // Formatear la salida como una cadena
  String resultado = '$gradosConvertidos° $minutosConvertidos\' ${segundosConvertidos.toStringAsFixed(2)}"';

  return resultado;
}

