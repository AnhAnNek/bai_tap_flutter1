import 'package:flutter/material.dart';
import 'introduction.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> handleLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showAlert('Error', 'Please fill in both fields.');
      return;
    }

    setState(() {
      _loading = true;
    });

    // Giả lập đăng nhập
    await Future.delayed(Duration(seconds: 2));

    _showAlert('Success', 'Logged in as $username');
    setState(() {
      _loading = false;
    });
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : handleLogin,
              child: Text(_loading ? 'Logging in...' : 'Login'),
            ),
            SizedBox(height: 20),
            // Nút quay lại trang giới thiệu
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => IntroductionPage()),
                );
              },
              child: Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
