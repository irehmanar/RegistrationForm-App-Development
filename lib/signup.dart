import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents the widget from resizing when the keyboard appears
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height, // Adjust the height as needed
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
                  "Signup",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(height: screenSize.height * 0.15), // Spacer between 'Login' and fields
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.manage_accounts_rounded, color: Colors.white),
                          SizedBox(width: 10), // Spacer between icon and text field
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: 'UserName',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.white),
                          SizedBox(width: 10), // Spacer between icon and text field
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.06), // Spacer between email and password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.lock, color: Colors.white),
                          SizedBox(width: 10), // Spacer between icon and text field
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.1), // Spacer between password and button
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>
                            (Colors.redAccent),
                          minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(12.0),
                        ),
                        child: Text('Signup', style: TextStyle(fontSize: 24.0,
                            color: Colors.white)),
                      ),
                      SizedBox(height: screenSize.height * 0.1), // Additional space at the bottom
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
