import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food/services/auth_service.dart';
import 'package:hugeicons/hugeicons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final authService = AuthService() ;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login () async{
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: HugeIcon(
                          icon: HugeIcons.strokeRoundedSquareLockPassword,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        labelStyle: TextStyle(fontSize: 15),
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
            TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: HugeIcon(
                          icon: HugeIcons.strokeRoundedSquareLockPassword,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        labelStyle: TextStyle(fontSize: 15),
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}