import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List<int>();
  int _ultimoItem = 0;
  //Controla el loading
  bool _cargando = false;

  @override
  //Metodo que se llama antes de iniciar la página, como un constructor
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  //Metodo que se ejecuta cuando la página se destrute
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas Page"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage("https://picsum.photos/id/$imagen/500/300"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      //Para que no se repitan las imagenes, tambien se
      //podria poner en 0, pero para pruebas lo haremos asi
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  Widget _crearLoading() {
    if (_cargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _cargando = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _cargando = false;
    _agregar10();

    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      curve: Curves.fastOutSlowIn,
      duration: Duration(
        milliseconds: 250,
      ),
    );
  }
}
