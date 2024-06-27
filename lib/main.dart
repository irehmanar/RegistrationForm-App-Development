import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the size of the screen
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg4.jpg"),
                fit: BoxFit.cover
            )),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Text("Abdul Rehman", style: TextStyle(fontSize: 32.0,color:
                  Colors.white)),
                ),
                Text("I am a Mern Stack Developer", style: TextStyle(fontSize:
                24.0,color: Colors.white)),
                SizedBox(height: screenSize.height * 0.35), // Responsive space
                // based on screen height
                Column(
                  children: <Widget>[
                    ElevatedButton(
                    onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          );
          },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(12.0),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 24.0, color: Colors.white)),
                    ),
                    SizedBox(height: screenSize.height * 0.04), // Responsive
                    // space based on screen height
                    ElevatedButton(
                        onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
      );
      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                        minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(12.0),
                      ),
                      child: Text('Signup', style: TextStyle(fontSize: 24.0, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
