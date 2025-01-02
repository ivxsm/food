import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
final supabase = Supabase.instance.client;

Future<AuthResponse> signInWithEmailPassword ( String email , String password) async{
    return await supabase.auth.signInWithPassword(password: password , email: email);
}

Future<AuthResponse> signup ( String email , String password) async{
    return await supabase.auth.signUp(password: password , email: email);
}

Future<void> signOut (){
return supabase.auth.signOut();
}

String? getemail (){
    final  session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.email ; 
}



}