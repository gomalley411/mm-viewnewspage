import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io' as IO;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(), // homepage
      '/first': (context) => MyApp(), // another way to get to the homepage
      '/second': (context) => ChooseLeagueType(),
      '/third': (context) => CreateLeague(),
      '/fourth': (context) => JoinLeagueApp(),
      '/fifth': (context) => JoinSpecificLeague(),
      '/sixth': (context) => CreateLineupPage(),
      '/seventh': (context) => ViewLineupPage(),
      '/eighth': (context) => ProfilePicUploadPage(),
      '/ninth': (context) => ViewNewsPage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/MoolahMasterLogo2.png',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: const Text(
                      'Moolah Master',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Color.fromRGBO(1, 25, 54, 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
    return MaterialApp(
      title: 'Moolah Master',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Bebas Neue',
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
          appBar: AppBar(
              title: Center(
            child: Text('Welcome to Moolah Master!'),
          )),
          body: Column(children: [
            titleSection,
            TextButton(
              child: Text(
                'Start',
                style: TextStyle(fontSize: 50.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  right: 15,
                  left: 15,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            Spacer(flex: 1),
            Row(children: [
              TextButton(
                child: Text(
                  'Change Profile Pic',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    right: 15,
                    left: 15,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/eighth');
                },
              ),
              TextButton(
                child: Text(
                  'News',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    right: 15,
                    left: 15,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/ninth');
                },
              ),
            ],
            ),

          ]
          )
      ),
    );
  }
}

class ChooseLeagueType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your League Type"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text(
              'Create League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                right: 15,
                left: 15,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
            child: Text(
              'Join League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                right: 15,
                left: 15,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sixth');
            },
            child: Text(
              'Resume League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateLeague extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      //padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Moolah Master',
                      style: TextStyle(
                          fontSize: 50, color: Color.fromRGBO(239, 41, 23, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      child: Image.asset(
                        'assets/MoolahMasterLogo2.png',
                        height: 95,
                        width: 95,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Future<void> sendData(formData) async {
      final header = {
        'Api-Version': 'v2',
        'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
      };
      final response = await http.post(
          Uri.parse('https://csc494apimgmt.azure-api.net/league'),
          headers: header,
          body: json.encode(formData));
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create League',
      theme: ThemeData(
          textTheme: GoogleFonts.bebasNeueTextTheme(
        Theme.of(context).textTheme,
      )),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(01, 19, 36, 20),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Create Your League!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                titleSection,
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderTextField(
                  name: 'league', //{'name': Sophia}
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER YOUR TEAM NAME',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderTextField(
                  name: 'owner', //{'email': email@email.com}
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER EMAIL',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderDropdown(
                  name: 'capacity',
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'NUMBER OF TEAM MEMBERS',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                  items: ['4', '6', '8']
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text('$val'),
                          ))
                      .toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                /*FormBuilderDropdown(
                name: 'league',
                decoration: InputDecoration(labelText: 'LEAGUE TYPE'),
                items: ['Basic League', 'Advanced League']
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text('$val'),
                        ))
                    .toList(),
              ),*/
                ButtonTheme(
                  minWidth: 200.0,
                  height: 70,
                  child: RaisedButton(
                    color: Color.fromRGBO(239, 41, 23, 1),
                    textColor: Colors.white,

                    onPressed: () async {
                      //saving form data
                      _formKey.currentState?.save();
                      final formData =
                          _formKey.currentState?.value; //all form values
                      print(
                          formData); //{'name': Sophia, 'email': email@email.com, 'number': 8 members, 'league': Basic League}
                      sendData(formData);
                    }, //FUCK YEAH BABY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    child: Text('continue', style: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JoinLeagueApp extends StatelessWidget {
  JoinLeagueApp(); //I had to make it not const so I could create these functions

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> sendData(formData) async {
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key':
          'c7d04b42632847e4bd1a633c4e54a75d', //I think this is the same???
    };
    final response = await http.post(
        Uri.parse('https://csc494apimgmt.azure-api.net/league'),
        headers: header,
        body: json.encode(formData));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const JoinLeagueScreen(),
        '/joinleague': (context) => const JoinLeagueScreen(),
      },
      /*home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
        ),
      ),*/
    );
  }
}

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen();

  final String leaguename =
      ""; // change this once we figure out how to get league name from the database

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Join a League!')),
      body: new Column(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Center(
                      child: Text(
                        'Moolah Master',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(239, 41, 23, 1),
                          fontFamily: 'Bebas Neue',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 60),
                    child: Image.asset(
                      'assets/MoolahMasterLogo2.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: FormBuilderTextField(
                        name: 'joinedleague',
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Color.fromRGBO(239, 41, 23, 1),
                            fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'ENTER A TEAM NAME:',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 10, right: 35, left: 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sixth');
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class JoinSpecificLeague extends StatelessWidget {
  const JoinSpecificLeague();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join a League"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          'Join a Moolah Master League',
        ),
      ),
    );
  }
}

class CreateLineupPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CreateLineupPage> createState() => _CreateLineupPageState();
}

class _CreateLineupPageState extends State<CreateLineupPage> {
  String teamname = "Teamname"; // change once we get team names from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose Your Lineup!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Text('${teamname}\'s current lineup:',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'bebas neue',
                  fontSize: 30,
                )),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
            ),
            Row(
              // this is where the actual stocks are gonna be displayed

              // stocks
              children: [
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
            ),
            const Text(
              "Tap the stocks from the selection below to add them to your lineup!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'bebas neue', fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'NASDAQ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'APPLE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'DOW JONES',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'MICROSOFT',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'TESLA',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'AMAZON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'BANK OF AMERICA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'EXXON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'JP MORGAN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, right: 35, left: 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewLineupPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ViewLineupPage> createState() => _ViewLineupPageState();
}

class _ViewLineupPageState extends State<ViewLineupPage> {
  String teamname = "Teamname"; // change once we get team names from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose Your Lineup!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Text('${teamname}\'s current lineup:',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'bebas neue',
                  fontSize: 30,
                )),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
            ),
            Row(
              // this is where the actual stocks are gonna be displayed

              // stocks
              children: [
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text(
                    'Name and price here',
                  ),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
            ),
            const Text(
              "Tap the stocks from the selection below to add them to your lineup!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'bebas neue', fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'NASDAQ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'APPLE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'DOW JONES',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'MICROSOFT',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'TESLA',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'AMAZON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'BANK OF AMERICA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'EXXON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'JP MORGAN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, right: 35, left: 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePicUploadPage extends StatefulWidget {
  const ProfilePicUploadPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfilePicUploadPageState createState() => _ProfilePicUploadPageState();
}

class _ProfilePicUploadPageState extends State<ProfilePicUploadPage> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFile = pickedFile;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }
  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (BuildContext context, int index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(IO.File(_imageFileList![index].path)),
              );
            },
            itemCount: _imageFileList!.length,
          ),
          label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImages();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
        _imageFileList = response.files;
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Profile Pic"),
      ),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _handlePreview();
                    default:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : _handlePreview(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image2',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: IconButton(
              icon: const BackButtonIcon(),
              color: Colors.red,
              tooltip: "Back",
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[ // these are all optional but I'm leaving them in in case the user wants/needs to modify their pic
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth,
    double? maxHeight,
    int? quality
);

class ViewNewsPage extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: const BackButtonIcon(),
            color: Colors.red,
            tooltip: "Back",
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            const Spacer(),
            Text('Here are some recent articles that may help you during gameplay.',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white),
            ),
            const Spacer(),

          ],
        ),
      ),

    );
  }

  @override
  _ViewNewsPageState createState() => _ViewNewsPageState();

}
class _ViewNewsPageState extends State<ViewNewsPage> {
  var client = http.Client();
  var headlines = ['','','','','','','',''];
  var urls = ['','','','','','','',''];

  fetchNews() async {
    print("in fetchNews");
    String url = 'https://MMWebScraperAI.gomalley411.repl.co';
    try {
      print("getting url");

      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
      var body = response.body;
      //print("Body: " + body);
      var i = jsonDecode(body);
      for (var n = 0; n < 8; n++) {
        //print("in for; " + i[n].toString());
        setState(() {
          headlines[n] = i[n]['headline'];
          urls[n] = i[n]['url'];
        });
      }
      //print(headlines);
      //print(urls);
      //print("Success");
    }
    finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState(); // requesting to fetch before UI drawing starts
    fetchNews();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromRGBO(01,19,36,20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text('Here are some recent articles that may help you during gameplay.',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontFamily: 'Bebas Neue'
              ),
            ),
            const Spacer(),
            const Text('Headlines taken from the New York Times. The links may take a while to load.',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: 'Bebas Neue',
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[0], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[0],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[1], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[1],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[2], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[2],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[3], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[3],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[4], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[4],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[5], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[5],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[6], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[6],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[7], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[7],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }


}
