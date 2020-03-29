import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name;
  final String image;
  final price;
  Description({this.name, this.image, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toUpperCase(),
            style: GoogleFonts.pressStart2P(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber,
      body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: ExpansionTile(
                    title: Text(
                      "\$" + price.toString(),
                      style: GoogleFonts.pressStart2P(
                        color: Colors.black,
                      ),
                    ),
                    leading: Icon(
                      Icons.local_convenience_store,
                      color: Colors.red,
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "R\$" + (price * 3).toString(),
                              style: GoogleFonts.pressStart2P(
                                  color: Colors.black, fontSize: 18),
                            ),
                            Text(''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: RaisedButton(
                    padding: EdgeInsets.all(18),
                    color: Colors.red,
                    child: Text(
                      "BUY",
                      style: GoogleFonts.pressStart2P(
                        color: Colors.yellow,
                        fontSize: 30,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
