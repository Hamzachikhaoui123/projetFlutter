import 'package:autoecole/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Meun extends StatefulWidget {
  @override
  _MeunState createState() => _MeunState();
}

class _MeunState extends State<Meun> {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlue],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "AutoEcole",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: myInput('', search, Icons.search_rounded, false),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 100, 10),
                  width: 120,
                  height: 120,
                  child: GestureDetector(
                    child: Image.asset('assets/video.png'),
                    onTap: () {
                      Navigator.pushNamed(context, '/examen');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  width: 120,
                  height: 120,
                  child: Image.asset('assets/voiture.png'),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    'Cours Code',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: Text(
                    'Vehicule',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 100, 10),
                  width: 120,
                  height: 120,
                  child: GestureDetector(
                    child: Image.asset('assets/actor.png'),
                    onTap: () {
                      Navigator.pushNamed(context, '/list');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
                  width: 120,
                  height: 120,
                  child: GestureDetector(
                    child: Image.asset('assets/calendar (1).png'),
                    onTap: () {
                      Navigator.pushNamed(context, '/agendaAuto');
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    'Mointeur',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(140, 10, 0, 0),
                  child: Text(
                    'Calendar',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
