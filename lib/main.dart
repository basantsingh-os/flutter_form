import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email, _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email: $_email passoword: $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Forms"),
          backgroundColor: Colors.green,
        ),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: new Form(
                key: formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                        decoration: new InputDecoration(labelText: "Email"),
                        validator: (val) =>
                            !val.contains('@') ? 'Invalid Email' : null,
                        onSaved: (val) => _email = val),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "passoword"),
                      validator: (val) =>
                          val.length < 6 ? 'passowrd too short' : null,
                      onSaved: (val) => _password = val,
                      obscureText: true,
                    ),
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new RaisedButton(
                      textColor: Colors.white,
                      child: new Text("Login"),
                      onPressed: _submit,
                      color: Colors.green,
                    )
                  ],
                ))));
  }
}
