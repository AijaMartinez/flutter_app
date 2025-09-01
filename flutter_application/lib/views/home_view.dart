import 'package:flutter/material.dart';

void main() => runApp(const HomeView());

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Inicio')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 600,
              height: 200,
              margin: const EdgeInsets.all(8),
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hola, Carlos",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Contacto: carlos@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Saldo: 12000",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Text("Tareas", style: TextStyle(color: Colors.black, fontSize: 18)),
            Container(
              width: 600,
              height: 200,
              margin: const EdgeInsets.all(8),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Comprar",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Ir al Ara",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Divider(color: Colors.white, thickness: 15, height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Transito",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Tramite",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
