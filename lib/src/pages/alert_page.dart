import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _mostrarAlert(context);
          },
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    //Alerta
    showDialog(
        //Obligatorio el build context de la aplicacion
        context: context,
        //Se puede cerrar dando click afuera
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Contenido'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Este es el contenido de la caja alerta"),
                FlutterLogo(
                  size: 100.0,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
