import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/pages/profile.dart';
import 'package:food/pages/sign.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        // } else if (snapshot.connectionState == ConnectionState.done) {
        // } else {
        //   return const Text("there's an unknown error");
         }

         final session = snapshot.hasData ? snapshot.data!.session : null ; 

         if (session != null){
          return Profile();
         }
         else {
          return Sign();
         }
      }
    );
  }
}
