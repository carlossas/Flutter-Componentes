import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Componentes Temp")),
        body: ListView(
            // children: _crearItems(),
            children: _crearItemsCortos()));
  }

  //Metodo para crear widgets desde un array, con un ciclo for
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      //Agregar el widget a la lista
      lista.add(tempWidget);

      //Agregar el divisor a la lista
      lista.add(Divider());
    }

    return lista;
  }

  //Metodo para crear widgets (corto)
  List<Widget> _crearItemsCortos() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text("Subtitulo"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
