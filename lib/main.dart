import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  late final ValueChanged<String> onSubmit;
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  var _text = "";
  var _text2 = "";

  void _submit() {
    if (_errorText == null && _errorText2 == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => secondpage()),
      );
    }
    return null;
  }

  String? get _errorText {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    }

    return null;
  }

  String? get _errorText2 {
    final text2 = _controller2.value.text;

    if (text2.isEmpty) {
      return 'Can\'t be empty';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          'LOGIN PAGE',
          style: TextStyle(
              color: Colors.black26, fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: <Widget>[
          Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    'To continue, enter your mail and password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 30),
                  ),
                ),
                height: 250,
              ),
              Container(
                color: Colors.white10,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter mail adress',
                    labelStyle: TextStyle(color: Colors.black),
                    errorText: _errorText,
                  ),
                  onChanged: (text) => setState(() => _text),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.white10,
                child: TextField(
                  controller: _controller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter password',
                    labelStyle: TextStyle(color: Colors.black),
                    errorText: _errorText2,
                  ),
                  onChanged: (text2) => setState(() => _text2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {
                    setState(() {
                      _submit();
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}

class secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
