import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_loginform/config.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      _showAlertDialog(context, 'Incomplete Data', 'Please enter all the required fields.', false);
    } else if (password.length < 9) {
      _showAlertDialog(context, 'Invalid Password', 'Password must be at least 9 characters long.', false);
    } else {
      var data = {'email': email, 'password': password};
      try {
        var response = await http.post(
          Uri.parse(login), // Correct login endpoint
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data),
        );

        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success']) {
          _showAlertDialog(context, 'Login Successful',
              jsonResponse['message'], false);
        } else {
          _showAlertDialog(context, 'Login Failed', jsonResponse['message'], false);
        }
      } catch (e) {
        _showAlertDialog(context, 'Error', 'An error occurred: $e', false);
      }
    }
  }

  void _showAlertDialog(BuildContext context, String title, String content, bool redirect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (redirect) {
                  Navigator.pushReplacementNamed(context, '/home'); // Redirect to home screen
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenSize.height * 0.06),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(height: screenSize.height * 0.15),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.lock, color: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.1),
                      GradientButton(
                        text: 'Login',
                        colors: [Colors.green, Colors.greenAccent],
                        onPressed: () => _login(context),
                      ),
                      SizedBox(height: screenSize.height * 0.1),
                    ],
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

class GradientButton extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.colors, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 12.0,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
