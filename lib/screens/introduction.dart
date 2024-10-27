import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int _secondsLeft = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Bắt đầu đếm ngược và chuyển trang sau 10 giây
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        _timer?.cancel();
        _navigateToLogin();
      }
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hủy bộ đếm khi trang bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Giới thiệu nhóm 10',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Trần Văn An - 21110120'),
            Text('Đặng Xuân Hùng - 21110194'),
            // Thêm các thành viên khác nếu cần
            SizedBox(height: 40),
            // Hiển thị đếm ngược
            Text(
              'Chuyển đến trang đăng nhập sau $_secondsLeft giây',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
