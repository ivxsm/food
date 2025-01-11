import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food/pages/home.dart';
import 'package:food/pages/regsiterpage.dart';
import 'package:food/services/auth_service.dart';
import 'package:hugeicons/hugeicons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode focusNodemil = FocusNode();
  final FocusNode focusNodpass = FocusNode();

  bool visiable = true;

  void login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final response =
          await authService.signInWithEmailPassword(email, password);
      if (response.session != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        throw Exception('Login failed. Please try again.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    focusNodemil.addListener(() {
      setState(() {});
    });
    focusNodpass.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    focusNodemil.dispose();
    focusNodpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'pick your food',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 3.0,
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedOrganicFood,
              color: Colors.black,
              size: 25.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'login',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextField(
              focusNode: focusNodemil,
              controller: _emailController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                suffixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedMail01,
                  color: Colors.black,
                  size: 24.0,
                ),
                labelStyle: const TextStyle(fontSize: 15),
                labelText: focusNodemil.hasFocus ? 'Email' : null,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: visiable,
              focusNode: focusNodpass,
              controller: _passwordController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    visiable = !visiable;
                    setState(() {});
                  },
                  child: HugeIcon(
                    icon: visiable
                        ? HugeIcons.strokeRoundedEye
                        : HugeIcons.strokeRoundedViewOff,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
                // prefixIcon: const HugeIcon(
                //   icon: HugeIcons.strokeRoundedSquareLockPassword,
                //   color: Colors.black,
                //   size: 24.0,
                // ),

                labelText: focusNodpass.hasFocus ? 'password' : null,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: const TextStyle(fontSize: 15),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Regsiterpage()));
              },
              child: const Text('Dont have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
