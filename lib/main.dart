import 'package:flutter/material.dart';
import 'profile_details.dart';
import 'result_view.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:intl/intl.dart';
import 'job_results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    findYourMentor() =>
        Intl.message('Find your mentor with us!',
            name: 'findYourMentor',
            args: [],
            desc: 'Find your mentor with us!'
            );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    flutterDemo() => Intl.message('Flutter Demo',
            name: 'flutterDemo',
            args: [],
            desc: 'Title of the app'
            );
    return MaterialApp(
      title: flutterDemo(),
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
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: findYourMentor()),
    );
  }
}

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    profileDetails() => Intl.message('Profile Details',
            name: 'profileDetails',
            args: [],
            desc: 'Profile Details'
            );
    return Text(
      profileDetails(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  _MyHomePageState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
        added.add(text);
      }),
    );
  }

  List<String> suggestions = [
    "Flutter",
    "Flying",
    "Flatter",
    "Flight",
    "Android",
    "Mobile",
    "Android Application",
    "Flurr",
  ];

  SimpleAutoCompleteTextField textField;


  tellUsWhatYouWantToLearn() =>
    Intl.message('Tell us what do you want to learn?',
            name: 'tellUsWhatYouWantToLearn',
            args: [],
            desc: 'Tell us what do you want to learn?'
            );
  jobsList() =>
    Intl.message('Go to jobs list',
            name: 'jobsList',
            args: [],
            desc: 'Go to jobs list'
            );
  searchMentorProfiles() =>
    Intl.message('Search Mentor Profiles',
            name: 'searchMentorProfiles',
            args: [],
            desc: 'Search Mentor Profiles'
            );
  goToProfileDetail() => Intl.message('Go to profile detail',
            name: 'goToProfileDetail',
            args: [],
            desc: 'Go to profile detail'
            );
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

          actions: [
            new IconButton(
                icon: new Icon(Icons.edit),
                onPressed: () => showDialog(
                    builder: (_) {
                      String text = "";

                      return new AlertDialog(
                          title: new Text("Change Suggestions"),
                          content:
                          new TextField(
                              decoration: InputDecoration(
                                hintText: 'Tell us what do you want to learn?',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                              onChanged: (newText) => text = newText
                          ),
                          actions: [
                            new FlatButton(
                                onPressed: () {
                                  if (text != "") {
                                    suggestions.add(text);
                                    textField.updateSuggestions(suggestions);
                                  }
                                  Navigator.pop(context);
                                },
                                child: new Text("Add")),
                          ]);
                    },
                    context: context))
          ]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new ListTile(
                title: textField,
             ),

            Padding(padding: EdgeInsets.only(top: 28.0)),
            RaisedButton(
              child: Text(jobsList()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobResultsPage()),
                );
              },
            ),
            RaisedButton(
              child: Text(searchMentorProfiles()),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultView()),
                );
              },
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods
    );}
}
