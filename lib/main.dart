import 'package:flutter/material.dart';
import 'package:muxidev/data_json/http_req.dart';
import 'package:muxidev/data_json/lista.dart';
import 'package:muxidev/pages/description.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Muxidev',
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.red
          //Color.fromARGB(255, 4, 125, 141),
          ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Feira do PEPE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Frutas frutas = Frutas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title.toUpperCase(),
            style: GoogleFonts.pressStart2P(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/bea_lista_de_compras.jpg',
                height: 900,
                fit: BoxFit.cover,
              ),
            ),
            FutureBuilder<List<ListaDeFrutas>>(
                future: frutas.getFrutas(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Erro ao carregar"),
                        );
                      } else {
                        List data = snapshot.data;
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Description(
                                      name: data[index].name,
                                      image: data[index].image,
                                      price: data[index].price,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.yellow,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[700],
                                          blurRadius: 8)
                                    ]),
                                margin: EdgeInsets.only(
                                  top: 18,
                                  right: 10,
                                ),
                                child: ListTile(
                                  enabled: true,
                                  title: Text(
                                    data[index].name,
                                    style: GoogleFonts.bungeeInline(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                      "\$" + data[index].price.toString(),
                                      style: GoogleFonts.pressStart2P(
                                          color: Colors.black)),
                                ),
                              ),
                            );
                          },
                        );
                      }
                  }
                }),
          ],
        ));
  }
}
