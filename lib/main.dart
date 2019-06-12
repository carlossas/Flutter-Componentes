import 'package:flutter/material.dart';
//Localizacion de la app
import 'package:flutter_localizations/flutter_localizations.dart';

//Rutas
import 'package:componentes/src/routes/routes.dart';

//Página por defecto cuando no se encuentra el nombre de la ruta
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es', 'MX'), // Español
      ],
      // home: HomePage());
      initialRoute: '/',
      routes: getApplicatonRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
