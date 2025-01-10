import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food/data/global_recipe.dart';
import 'package:food/pages/home.dart';
import 'package:food/services/api.dart';
import 'package:food/services/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future <void>  main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

   await Supabase.initialize(
    url: dotenv.env['supaurl']!,
    anonKey: dotenv.env['supakey']!,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}
