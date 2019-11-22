import 'package:flutter/material.dart';
import 'package:flutter_app/show_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String alican = "";
  String muhammed = "";

  final _formKey = GlobalKey<FormState>();

  TextFormField textFormElement(String text, Function mSetState) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return "Please set your value";
        }
        setState(() {
          mSetState(value);
        });
        return null;
      },
      decoration:
          InputDecoration(labelText: 'Enter your username', hintText: text),
    );
  }

  DefaultTabController defaultTabController(Scaffold scaffold) {
    return DefaultTabController(
      length: 3,
      child: scaffold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return defaultTabController(
      Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: Text("asdasd"),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[Text("aa"), Text("aa")],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      textFormElement("alican", (value) {
                        this.alican = value;
                      }),
                      textFormElement("muhammed", (value) {
                        this.muhammed = value;
                      }),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
//                      Navigator.push(context, MaterialPageRoute(
//                        builder: (context) =>
//                            ShowScreen( ),)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShowScreen(
                          title: 'show screen',
                            alican: this.alican, muhammed: this.muhammed),
                      ));
                    }
                  },
                  child: Text("Sum"),
                )
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
