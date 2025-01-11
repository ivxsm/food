import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/bookmarks.dart';
import 'package:food/pages/home.dart';
import 'package:food/pages/login.dart';
import 'package:food/services/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authService = AuthService();

  void logout() async {
  await authService.signOut();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Login()),
    (route) => false, // This clears all previous routes
  );
}


  final currentEmail = AuthService().getemail();

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
            child:
                Text(currentEmail.toString(), style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: logout, child: Text('Logout?')),
        ],
      ),

    
    );
  }
}
