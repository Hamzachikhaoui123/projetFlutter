import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding myInput(String hintText, TextEditingController controller,
    IconData myicons, bool myPassword) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
    child: Form(
      child: TextFormField(
        controller: controller,
        obscureText: myPassword,
        style: TextStyle(fontSize: 15),
        cursorColor: Colors.lightBlueAccent,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 0.0),
          ),
          hintText: hintText,
          fillColor: Colors.black12,
          filled: true,
          prefixIcon: Icon(
            myicons,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    ),
  );
}

Widget imageProfile() {
  BuildContext context;
  return Stack(
    children: [
      CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage('assets/actor.png'),
        backgroundColor: Colors.limeAccent,
      ),
      Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => bottomSheet());
            },
          ))
    ],
  );
}

Widget bottomSheet() {
  BuildContext context;
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: [
        Text(
          'Choose Profile photo',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.camera),
              label: Text("Camera"),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.image),
              label: Text("Gallery"),
            ),
          ],
        )
      ],
    ),
  );
}

Future<void> showMyDialog(BuildContext context, String title, String message,
    Function onPressed) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(message),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}
