import 'dart:ui';

import 'package:camera_roll_uploader/camera_roll_uploader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'dart:io' as IO;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';
import 'package:image_picker/image_picker.dart'; // not sure if needed but keeping it here in case it is later
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart'; // not sure if needed but keeping it here in case it is later
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:audio_manager/audio_manager.dart'; // not sure if needed but keeping it here in case it is later
//import 'package:flutter_audio_query/flutter_audio_query.dart';

/*dependencies with errors:
flutter_audio_query: ^0.3.5+6
  audio_manager: ^0.8.2
*
* */
//The testing version

Map stocks = {};
Map tickers = {};
Map names = {};
String s1 = '';
String s2 = '';
String s3 = '';
String s4 = '';
String s5 = '';
//for team vs opp
Map response_1 = {};
Map r1 = {}; //team 1
Map r2 = {}; //team 2
Map test = {'0': 'MSFT', '1': 'AAPL', '2': 'COM', '3': 'NKE', '4': 'STCK'};
Map test2 = {'0': 'SFC', '1': 'ABC', '2': 'DEC', '3': 'NKE', '4': 'LOK'};
Map p1 = {}; //portfolio 1
Map p2 = {}; //portfolio 2
Map po1 = {}; //points parallel to portfolio 1
Map po2 = {}; //points parallel to portfolio 2
String teamName = "";
String email = "";
int numTeam = 0;
DateTime? date;
String d2 = "";
String _currentSelectedValue = '';
int numMem = 0;

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/second': (context) => ChooseLeagueType(),
      '/twoAndAHalf': (context) => resumeLeagueOptions(),
      '/third': (context) => CreateLeague(),
      '/fourth': (context) => JoinLeagueApp(),
      '/fifth': (context) => JoinSpecificLeague(),
      '/sixth': (context) => CreateLineupPage(),
      '/sixthAndAHalf': (context) => ChooseSharesPage(),
      '/seventh': (context) => _ViewLineupPageState(),
      '/tenth': (context) => teamvsOpp(),
      '/eleventh': (context) => ViewCurrentStandings(),
      '/twelfth': (context) => ViewRecord(),
      '/thirteenth': (context) => ViewNewsPage(),
    },
  ));
  testWidgets('finds a widget using a Key', (WidgetTester tester) async {
    // Define the test key.
    const testKey = Key('K');

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
    );
    return MaterialApp(
      title: 'Moolah Master',
      theme: ThemeData(
        // is not restarted.
        fontFamily: 'Bebas Neue',
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Center(
              child: Text('Welcome to Moolah Master',
                  style: TextStyle(color: Colors.white)),
            )),
        body: Center(
            child: Column(children: <Widget>[
              Image.asset(
                'assets/MoolahMasterLogo2.png',
                scale: 1.3,
              ),
              Container(
                child: Text(
                  'Moolah Master',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding( padding: EdgeInsets.all(20),
                child: Flexible(
                  child: TextButton(
                    child: Text(
                      'Start',
                      style: TextStyle(fontSize: 50.0, color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      primary: Color.fromRGBO(1, 25, 54, 1.0),
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                      padding:
                      EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}

class ChooseLeagueType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Bebas Neue',
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Choose Your League Type",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                'Resume a current league, create a new league, or join a friend\'s league:',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/thirteenth');
              },
              child: Text("View news"),
            ),

            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/twoAndAHalf');
              },
              label: Image.asset(
                'assets/resumeButton.png',
                scale: 6,
                alignment: FractionalOffset.centerRight,
              ),
              icon: Text(
                'Resume League',
                style: TextStyle(fontSize: 50.0,),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                minimumSize: Size(350, 100),
                padding:
                EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Spacer(),
            TextButton.icon(

              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              label: Image.asset(
                'assets/createButton.png',
                scale: 6,
              ),
              icon: Text(
                'Create League',
                style: TextStyle(fontSize: 50.0),
              ),
              style: TextButton.styleFrom(
                alignment: FractionalOffset.center,
                primary: Colors.white,
                minimumSize: Size(350, 100),
                backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                padding:
                EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Spacer(),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
              label: Image.asset(
                'assets/joinButton.png',
                scale: 6,
              ),
              icon: Text(
                'Join League',
                style: TextStyle(fontSize: 50.0),
              ),
              style: TextButton.styleFrom(
                alignment: FractionalOffset.center,
                primary: Colors.white,
                minimumSize: Size(350, 100),
                backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                padding:
                EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class resumeLeagueOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Bebas Neue',
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Resume League', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Spacer(),
            Text('View Information about your current league and team:',
                style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center),
            Spacer(),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/seventh');
                },
                label: Image.asset(
                  'assets/viewStocksButton.png',
                  scale: 6,
                  alignment: FractionalOffset.centerRight,
                ),
                icon: Text(
                  'View Your Stock Choices',
                  style: TextStyle(fontSize: 30.0,),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                  minimumSize: Size(335, 100),
                  padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/eleventh');
                },
                label: Image.asset(
                  'assets/viewStandingsButton.png',
                  scale: 6,
                  alignment: FractionalOffset.centerRight,
                ),
                icon: Text(
                  'View Current Standings',
                  style: TextStyle(fontSize: 30.0,),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                  minimumSize: Size(335, 100),
                  padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/tenth');
                },
                label: Image.asset(
                  'assets/teamVsOppButton.png',
                  scale: 6,
                  alignment: FractionalOffset.centerRight,
                ),
                icon: Text(
                  'Team vs. Opp. Standings',
                  style: TextStyle(fontSize: 30.0,),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                  minimumSize: Size(335, 100),
                  padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: TextButton.icon(

                onPressed: () {
                  Navigator.pushNamed(context, '/twelfth');
                },
                label: Image.asset(
                  'assets/record.png',
                  scale: 6,
                  alignment: FractionalOffset.centerRight,
                ),
                icon: Text(
                  'View Your Team\'s Record',
                  style: TextStyle(fontSize: 30.0,),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                  minimumSize: Size(335, 100),
                  padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CreateLeague extends StatefulWidget {
  @override
  _CreateLeagueState createState() => _CreateLeagueState();

  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create League',
      theme: ThemeData(
          textTheme: GoogleFonts.bebasNeueTextTheme(
            Theme
                .of(context)
                .textTheme,
          )),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(01, 19, 36, 20),
        body: MyCustomForm(),
      ),
    );
  }
}

class _CreateLeagueState extends State<CreateLeague> {
  @override
  //final _formKey = GlobalKey<FormBuilderState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _date = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  String dropdownValue = 'CHOOSE NUMBER OF TEAM MEMBERS';

  void initState() {
    //dateinput.text = ""; //set the initial value of text field
  }

  Widget build(BuildContext context) {
    //Color color = Theme.of(context).primaryColor;

    Future<void> sendData(formData) async {
      final header = {
        'Api-Version': 'v2',
        'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
      };
      final response = await http.post(
          Uri.parse('https://csc494apimgmt.azure-api.net/league'),
          headers: header,
          body: json.encode(formData));
      //print('Status code: ${response.statusCode}');
      //print('Body: ${response.body}');
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
        /*appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Create Your League!'),
        ),*/
        body: Center(
            child: Column(children: <Widget>[
              Spacer(),
              TextFormField(
                controller: _controller,
                style:
                TextStyle(color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'ENTER YOUR TEAM NAME',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0)),
                  border: const OutlineInputBorder(),
                ),
                onFieldSubmitted: (text) {
                  /**in case the user hits enter */
                  setState((() => teamName = text));
                  //print(teamName);
                  _controller.clear();
                },
                onEditingComplete: () {
                  TextInputAction.send;
                },
                onChanged: (text) {
                  //print(text);
                  setState((() => teamName = text));
                },
              ),
              Spacer(),
              TextFormField(
                  controller: _controller2,
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER YOUR EMAIL',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (text) {
                    setState((() => email = text));
                    //print(email);
                    _controller2.clear();
                  },
                  onEditingComplete: () {
                    TextInputAction.send;
                  },
                  onChanged: (text) {
                    //print(text);
                    setState((() => email = text));
                  },
                  validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter valid email'
                      : null),
              Spacer(),
              TextFormField(
                  controller: _date,
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER TODAY\'S DATE',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? d1 = DateTime.now();
                    date = await showDatePicker(
                      context: context,
                      initialDate: d1,
                      firstDate: d1,
                      lastDate: d1,
                    );
                    setState(() => d2 = DateFormat('yyyy-MM-dd').format(d1));
                    _date.text = d2;
                    //print(d2);
                  }),
              Spacer(),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Color.fromRGBO(239, 41, 23, 1)),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                  setState(() => numMem = int.parse(dropdownValue));
                  //print(dropdownValue);
                },
                items: <String>['CHOOSE NUMBER OF TEAM MEMBERS', '2', '4', '6']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Spacer(),
              ButtonTheme(
                minWidth: 200.0,
                height: 70,
                child: RaisedButton(
                  color: Color.fromRGBO(239, 41, 23, 1),
                  textColor: Colors.white,
                  onPressed: () async {
                    //final form = _formKey.currentState!;
                    //print(form);
                    //if (form.validate()) {
                    //  print("email good");
                    //} else {
                    //  print("uh oh");
                    //}
                    Map response = {
                      'name': teamName,
                      'email': email,
                      'number': numMem,
                      'date': d2,
                    };
                    print(response);
                  },
                  child: Text('continue', style: TextStyle(fontSize: 30)),
                ),
              ),
            ])),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _date = TextEditingController();
  String dropdownValue = 'CHOOSE NUMBER OF TEAM MEMBERS';

  @override
  Widget build(BuildContext context) {
    //Color color = Theme.of(context).primaryColor;
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

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          TextFormField(
            controller: _controller,
            style:
            TextStyle(color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
            decoration: InputDecoration(
              labelText: 'ENTER YOUR TEAM NAME',
              labelStyle: TextStyle(color: Colors.white, fontSize: 30),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0)),
              border: const OutlineInputBorder(),
            ),
          ),
          Spacer(),
          TextFormField(
            // The validator receives the text that the user has entered.
            style:
            TextStyle(color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
            decoration: InputDecoration(
              labelText: 'ENTER YOUR EMAIL',
              labelStyle: TextStyle(color: Colors.white, fontSize: 30),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0)),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value != null && !EmailValidator.validate(value)) {
                return 'Enter a real email';
              }
              return null;
            },
          ),
          Spacer(),
          TextFormField(
              controller: _date,
              style: TextStyle(
                  color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
              decoration: InputDecoration(
                labelText: 'ENTER TODAY\'S DATE',
                labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                border: const OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? d1 = DateTime.now();
                date = await showDatePicker(
                  context: context,
                  initialDate: d1,
                  firstDate: d1,
                  lastDate: d1,
                );
                setState(() => d2 = DateFormat('yyyy-MM-dd').format(d1));
                _date.text = d2;
              }),
          Spacer(),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Color.fromRGBO(239, 41, 23, 1)),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
              setState(() => numMem = int.parse(dropdownValue));
            },
            items: <String>['CHOOSE NUMBER OF TEAM MEMBERS', '2', '4', '6']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              width: 120,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(239, 41, 23, 1),
                  ),
                  //textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    setState(() => teamName = _controller.text);
                    Map response = {
                      'name': teamName,
                      'email': email,
                      'number': numMem,
                      'date': d2,
                    };
                    print(response);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
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
          title: const Text('Join a League!',
              style: TextStyle(fontFamily: 'Bebas Neue'))),
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
                              BorderSide(color: Colors.white, width: 0.0)),
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
  @override
  State<CreateLineupPage> createState() => _CreateLineupPageState();
}

class _CreateLineupPageState extends State<CreateLineupPage> {
  String teamname = "Teamname"; // change once we get team names from API
  /**Created by: Sophia S Last Modified: 3/22/22 */
  @override
  void initState() {
    getStocks();
    super.initState();
  }

  /**Created by: Sophia S Last Modified: 3/24/22 */
  Future<void> getStocks() async {
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
    };
    final response = await http.get(
        Uri.parse('https://csc494apimgmt.azure-api.net/league/stocks'),
        headers: header);
    setState(() => stocks = jsonDecode(response.body));
    map(stocks);
  }

  /**Created by: Sophia S Last Modified: 3/25/22 */
  Future<void> sendStocks() async {
    Map<String, String> bod = {
      's1': s1,
      's2': s2,
      's3': s3,
      's4': s4,
      's5': s5
    };
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
    };
    //final response = await http.post(
    //    Uri.parse('https://csc494apimgmt.azure-api.net/league/stocks'),
    //    headers: header,
    //    body: json.encode(bod));
    print(bod);
  }

  /**Created by: Sophia S Last Modified: 3/24/22 */
  void map(Map map) {
    // Get all keys
    int key = 1;
    map['stocks'].elementAt(0).keys.forEach((keys) {
      setState(() => tickers['$key'] = '$keys');
      key += 1;
    });
    // Get all values
    key = 1;
    map['stocks'].elementAt(0).values.forEach((values) {
      setState(() => names['$key'] = '$values');
      key += 1;
    });
  }

  void set(String stock) {
    /**Created by: Sophia S Last Modified: 3/25/22 */
    //this sets the text in the row of boxes for the selected stocks
    if (s1 == '') {
      setState(() => s1 = stock);
    } else if (s2 == '') {
      setState(() => s2 = stock);
    } else if (s3 == '') {
      setState(() => s3 = stock);
    } else if (s4 == '') {
      setState(() => s4 = stock);
    } else {
      setState(() => s5 = stock);
    }
  }

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose Your Lineup!',
            style: TextStyle(fontFamily: 'Bebas Neue')),
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
                  child: Center(
                      child: Text(
                        '${s1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Center(
                      child: Text(
                        '${s2}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Center(
                      child: Text(
                        '${s3}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Center(
                      child: Text(
                        '${s4}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Center(
                      child: Text(
                        '${s5}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
                const Spacer(),
              ],
            ),
            Row(
              // delete buttons
              children: [
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: TextButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Bebas Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                    ),
                    onPressed: () {
                      setState(() => s1 = '');
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: TextButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Bebas Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                    ),
                    onPressed: () {
                      setState(() => s2 = '');
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: TextButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Bebas Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                    ),
                    onPressed: () {
                      setState(() => s3 = '');
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: TextButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Bebas Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                    ),
                    onPressed: () {
                      setState(() => s4 = '');
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 75,
                  child: TextButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Bebas Neue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                    ),
                    onPressed: () {
                      setState(() => s5 = '');
                    },
                  ),
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
                    color: Colors.white,
                    fontFamily: 'bebas neue',
                    fontSize: 30)),
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
                          "${tickers['1']}",
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
                          set(tickers['1']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['2']}",
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
                          set(tickers['2']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['3']}",
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
                          set(tickers['3']);
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
                          "${tickers['4']}",
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
                          set(tickers['4']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['5']}",
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
                          set(tickers['5']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['6']}",
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
                          set(tickers['6']);
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
                          "${tickers['7']}",
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
                          set(tickers['7']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['8']}",
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
                          set(tickers['8']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['9']}",
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
                          set(tickers['9']);
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
                          "${tickers['10']}",
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
                          set(tickers['10']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['11']}",
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
                          set(tickers['11']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['12']}",
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
                          set(tickers['12']);
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
                          "${tickers['13']}",
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
                          set(tickers['13']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['14']}",
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
                          set(tickers['14']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['15']}",
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
                          set(tickers['15']);
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
                          "${tickers['16']}",
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
                          set(tickers['16']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['17']}",
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
                          set(tickers['17']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['18']}",
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
                          set(tickers['18']);
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
                          "${tickers['19']}",
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
                          set(tickers['19']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['20']}",
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
                          set(tickers['20']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['21']}",
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
                          set(tickers['21']);
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
                          "${tickers['22']}",
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
                          set(tickers['22']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['23']}",
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
                          set(tickers['23']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['24']}",
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
                          set(tickers['24']);
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
                          "${tickers['25']}",
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
                          set(tickers['25']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['26']}",
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
                          set(tickers['26']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['27']}",
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
                          set(tickers['27']);
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
                          "${tickers['28']}",
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
                          set(tickers['28']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['29']}",
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
                          set(tickers['29']);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          "${tickers['30']}",
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
                          set(tickers['30']);
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
                onPressed: () async {
                  await sendStocks();
                  Navigator.pushNamed(context, '/eleventh');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseSharesPage extends StatefulWidget {
  @override
  State<ChooseSharesPage> createState() => ChooseSharesPageState();
}

class ChooseSharesPageState extends State<ChooseSharesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose amount of shares for your stocks',
            style: TextStyle(fontFamily: 'Bebas Neue')),
      ),
    );
  }
}

class _ViewLineupPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('View Your Lineup!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Text(
              'Your lineup:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'bebas neue',
                fontSize: 30,
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: 350,
              color: Color.fromRGBO(239, 41, 23, 1),
              child: Center(
                child: Text(
                  'First Choice',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: 350,
              color: Color.fromRGBO(239, 41, 23, 1),
              child: Center(
                child: Text(
                  'Second Choice',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: 350,
              color: Color.fromRGBO(239, 41, 23, 1),
              child: Center(
                child: Text(
                  'Third Choice',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: 350,
              color: Color.fromRGBO(239, 41, 23, 1),
              child: Center(
                child: Text(
                  'Fourth Choice',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: 350,
              color: Color.fromRGBO(239, 41, 23, 1),
              child: Center(
                child: Text(
                  'Fifth Choice',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewCurrentStandings extends StatefulWidget {
  @override
  State<ViewCurrentStandings> createState() => _ViewCurrentStandingsState();
}

class _ViewCurrentStandingsState extends State<ViewCurrentStandings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('View Current League Standings',
            style: TextStyle(fontFamily: 'Bebas Neue')),
      ),
      body: Stack(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text('Here is how your stocks are doing today:',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center),
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              Column(
                children: [
                  Spacer(),
                  Container(
                    width: 100,
                    height: 75,
                    color: Color.fromRGBO(239, 41, 23, 1),
                    child: Center(
                        child: Text(
                          'Stock',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 75,
                    color: Color.fromRGBO(239, 41, 23, 1),
                    child: Center(
                        child: Text(
                          'Stock',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 75,
                    color: Color.fromRGBO(239, 41, 23, 1),
                    child: Center(
                        child: Text(
                          'Stock',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 75,
                    color: Color.fromRGBO(239, 41, 23, 1),
                    child: Center(
                        child: Text(
                          'Stock',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 75,
                    color: Color.fromRGBO(239, 41, 23, 1),
                    child: Center(
                        child: Text(
                          'Stock',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Spacer(),
                  Container(
                    width: 175,
                    height: 75,
                    color: Color.fromRGBO(4, 119, 111, 1),
                    child: Center(
                        child: Text(
                          'Stockdata',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 175,
                    height: 75,
                    color: Color.fromRGBO(4, 119, 111, 1),
                    child: Center(
                        child: Text(
                          'Stockdata',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 175,
                    height: 75,
                    color: Color.fromRGBO(4, 119, 111, 1),
                    child: Center(
                        child: Text(
                          'Stockdata',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 175,
                    height: 75,
                    color: Color.fromRGBO(4, 119, 111, 1),
                    child: Center(
                        child: Text(
                          'Stockdata',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                  Container(
                    width: 175,
                    height: 75,
                    color: Color.fromRGBO(4, 119, 111, 1),
                    child: Center(
                        child: Text(
                          'Stockdata',
                          //will replace this with their stocks from the database when I figure out how
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class teamvsOpp extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team vs Opponent',
      theme: ThemeData(
          textTheme: GoogleFonts.bebasNeueTextTheme(
            Theme.of(context).textTheme,
          )),
      home: teamOpp(),
    );
  }
}

class teamOpp extends StatefulWidget {
  @override
  _teamOppState createState() => _teamOppState();
}

class _teamOppState extends State<teamOpp> {
  @override
  void initState() {
    getMatchup();
    super.initState();
  }

  Future<void> getMatchup() async {
    final body = {"leagueID": "1", "week_number": "1", "teamID": "1"};
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
    };
    final response = await http.post(
        Uri.parse(
            'https://csc494apimgmt.azure-api.net/league/league/matchup/stats'),
        headers: header,
        body: jsonEncode(body));
    //print(response.body);
    setState(() => response_1 = jsonDecode(response.body));
    map(response_1);
  }

  void map(Map map) {
    // Get all keys
    map['team1'].forEach((keys, values) {
      setState(() => r1[keys] = values);
    });
    map['team2'].forEach((keys, values) {
      setState(() => r2[keys] = values);
    });
    setP(r1, r2);
  }

  void setP(Map map1, Map map2) {
    Map h1 = {};
    int index = 0;
    map1['stocks'].forEach((values) {
      h1['${index}'] = values;
      index += 1;
    });
    index = 0;
    h1.forEach((key, value) {
      Map values = value;
      values.forEach((key, value) {
        if (key == "ticker") {
          setState(() => p1['${index}'] = value);
        } else {
          setState(() => po1['${index}'] = value);
        }
        index += 1;
      });
    });
    index = 0;
    h1 = {};
    map2['stocks'].forEach((values) {
      h1['${index}'] = values;
      index += 1;
    });
    index = 0;
    h1.forEach((key, value) {
      Map values = value;
      values.forEach((key, value) {
        if (key == "ticker") {
          setState(() => p2['${index}'] = value);
        } else {
          setState(() => po2['${index}'] = value);
        }
        index += 1;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(03, 47, 32, 20),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Team vs Opponent'),
        ),
        body: pageBuild());
  }
}

class pageBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(03, 47, 32, 20),
      body: ListView(
        children: [
          Center(
            child: Text(
              "${r1['team']} vs ${r2['team']}",
              style: TextStyle(
                  color: Color.fromARGB(215, 1, 185, 112), fontSize: 40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                //your team
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "${r1['team']}",
                    style: TextStyle(
                        color: Color.fromARGB(215, 1, 185, 112), fontSize: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "Projected Points: ${r1['total_points']}",
                    style: TextStyle(
                        color: Color.fromRGBO(207, 255, 179, 1), fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "Team 1 portfolio: ",
                    style: TextStyle(
                        color: Color.fromRGBO(207, 255, 179, 1), fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test['0']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test['1']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test['2']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test['3']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test['4']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                ],
              ),
              Column(
                //opponent
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "${r2['team']}",
                    style: TextStyle(
                        color: Color.fromARGB(215, 1, 185, 112), fontSize: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "Projected Points: ${r2['total_points']}",
                    style: TextStyle(
                        color: Color.fromRGBO(207, 255, 179, 1), fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Text(
                    "Team 2 portfolio:",
                    style: TextStyle(
                        color: Color.fromRGBO(207, 255, 179, 1), fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test2['0']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test2['1']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test2['2']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test2['3']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 70),
                      primary: Color.fromRGBO(239, 41, 23, 1),
                      onPrimary: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {},
                    child: Text('${test2['4']}',
                        style: TextStyle(
                            fontSize: 30)), //this will be stock ticker?
                  ),
                ],
              ),
              /*Flexible(
                  child: SizedBox(
                      height: 100.0, width: 100.0, child: widgetBuild())),*/
            ],
          ),
          /*Center(
            child: ButtonTheme(
              minWidth: 200.0,
              height: 70,
              child: RaisedButton(
                color: Color.fromRGBO(239, 41, 23, 1),
                textColor: Color.fromRGBO(255, 255, 255, 1),
                onPressed: () {
                  print("clicked");
                },
                child: Text(
                    'This Could Be A Scrollbar so the User Can Pick Another Team To View',
                    style:
                        TextStyle(fontSize: 20)), //this will be stock ticker?
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class widgetBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(03, 47, 32, 20),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: p1.length,
            itemBuilder: (context, int itemIndex) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 70),
                  primary: Color.fromRGBO(239, 41, 23, 1),
                  onPrimary: Color.fromRGBO(255, 255, 255, 1),
                ),
                onPressed: () {},
                child: Text('${p1.values.elementAt(itemIndex)}',
                    style:
                    TextStyle(fontSize: 30)), //this will be stock ticker?
              );
            }));
  }
}

class ViewRecord extends StatefulWidget {
  @override
  State<ViewRecord> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  String teamname = 'Teamname';
  String wins = '5';
  String losses = '3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('View Your Team\'s Record',
            style: TextStyle(fontFamily: 'Bebas Neue')),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.white)),
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Text('${teamname}\'s Win/Loss record',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bebas Neue',
                          fontSize: 30)),
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Padding(
                padding:
                EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Text('${teamname} has won ${wins} times',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Bebas Neue',
                        fontSize: 30)),
              ),
            ),
            Image.asset('assets/winImage.png'),
            Container(
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Padding(
                padding:
                EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Text('${teamname} has lost ${losses} times',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Bebas Neue',
                        fontSize: 30)),
              ),
            ),
            Image.asset('assets/loss.png'),
          ],
        ),
      ),
    );
  }
}
class ProfilePicUploadPage extends StatefulWidget {
  @override
  State<ProfilePicUploadPage> createState() => _ProfilePicUploadPageState();
}

class _ProfilePicUploadPageState extends State<ProfilePicUploadPage> {
  var image;
  var imgpath;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text("Embedded Camera Roll Picker"),
          ),
          body: CameraRollUploader(
            isDownloadingImage: (downloading) {
              print("downloading $downloading");
            },
            selectedImageCallback: (imagePath) {
              print("imagePath $imagePath");
              Image.file(IO.File(imagePath!),fit: BoxFit.cover,);
              imgpath = imagePath;
            },
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (IO.Platform.isIOS)
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: FloatingActionButton(
                    heroTag: "modal",
                    child: Text(
                      "SHOW\nMODAL",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => _openPicker(context),
                  ),
                ),
              )
                  : Container(
                width: 0.0,
                height: 0.0,
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  heroTag: "push",
                  backgroundColor: Colors.black,
                  child: Text(
                    "Back",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/first'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openPicker(BuildContext context, {bool isModal = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: isModal,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: CameraRollUploader(),
          );
        },
      ),
    );
  }
}
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
    //print("in fetchNews");
    String url = 'https://MMWebScraperAI.gomalley411.repl.co';
    try {
      //print("getting url");

      var response = await http.get(Uri.parse(url));
      //print(response.statusCode);
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
        child: Expanded(
            child: ListView(
            padding: const EdgeInsets.all(80),
                children: <Widget>[
                    const Text('Here are some recent articles that may help you during gameplay.',
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontFamily: 'Bebas Neue'
                      ),
                    ),
                    const Spacer(),
                    const Text('Headlines taken from the New York Times.',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'Bebas Neue',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(239, 41, 23, 1),
                        onPrimary: Color.fromRGBO(255, 255, 255, 1),
                      ),
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
              shrinkWrap: true,
            ),
        ),
      ),
    );
  }


}
