import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/login.dart';
import 'package:food/services/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
final authService = AuthService() ;

void logout() async {
  await authService.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Text('Profile'),
          ),

        ElevatedButton(onPressed: logout, child: Text('Logout'))
        ],
      ),
    );
  }
}