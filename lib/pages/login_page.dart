import 'package:flutter/material.dart';
import 'package:rejalar_apps/pages/home_page.dart';
import 'package:rejalar_apps/service/secure_storage.dart';
import 'package:rejalar_apps/service/shared_preference.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void saveInfo() {
    String email = _emailController.text.trim().toString();
    String password = _passwordController.text.trim().toString();
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    SecureStorage.storeApiKey(password);
    SharedPreference.storeName(email);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
          ),
          InkWell(
            onTap: (){
              saveInfo();
            },
            child: Container(
              margin: EdgeInsets.all(30),
              height: 60,
              color: Colors.orange,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
