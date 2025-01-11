import 'package:flutter/material.dart';
import 'package:food/services/auth_service.dart';
import 'package:hugeicons/hugeicons.dart';

class Regsiterpage extends StatefulWidget {
  const Regsiterpage({super.key});

  @override
  State<Regsiterpage> createState() => _RegsiterpageState();
}

class _RegsiterpageState extends State<Regsiterpage> {

  final authService = AuthService() ;
  bool visiable = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conformPasswordController = TextEditingController();
  final FocusNode focusNodemil = FocusNode();
  final FocusNode focusNodpass = FocusNode();
  final FocusNode focusNodconform = FocusNode();

  void register () async{
    final email = _emailController.text;
    final password = _passwordController.text;
    final conformPassword = _conformPasswordController.text;

    if (password != conformPassword){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password does not match'),
        ),
      );
      return;
    }

    try {
      await authService.signup(email, password);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
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
    focusNodconform.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' create your account !!' , style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('sign up with us ' , style: TextStyle(fontSize: 25),),
            SizedBox(
            height:50.0,
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
                  onTap: (){
                    visiable = !visiable;
                    setState(() {
                    });
                  },
                  child: HugeIcon(
                    icon: visiable? HugeIcons.strokeRoundedEye : HugeIcons.strokeRoundedViewOff,
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
            TextField(
              focusNode: focusNodconform,
              controller: _conformPasswordController,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                suffixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedPasswordValidation,
                  color: Colors.black,
                  size: 24.0,
                ),
                labelStyle: const TextStyle(fontSize: 15),
                labelText: focusNodemil.hasFocus ? 'conform pass' : null,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: register,
              child: const Text('resgister'),
              
            ),
          ],
        ),
      ),
    );
  }
}