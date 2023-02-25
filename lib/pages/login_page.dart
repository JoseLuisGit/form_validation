import 'package:flutter/material.dart';
import 'package:form_validation/providers/login_form_provider.dart';
import 'package:form_validation/ui/input_decorations.dart';
import 'package:form_validation/widgets/auth_background.dart';
import 'package:form_validation/widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              CardContainer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Login', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 20),
                      ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: _LoginForm(),
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox( height: 50,),
              const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'example@g.com', 
              labelText: 'Email',
              prefixIcon: Icons.email_outlined
              ),
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Email invalido';
              },  
          ),
          const SizedBox(
            height: 20,
          ),
            TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: '**********', 
              labelText: 'Password',
              prefixIcon: Icons.security
              ),
              validator: (value) {
                if(value != null && value.length >= 6) return null;
                return 'Password invalido';
              },    
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onLongPress: null,
            onPressed: loginForm.isLoading? null : () async{
              FocusScope.of(context).unfocus(); //keyboard
              if(loginForm.isValidate()){
                
                loginForm.isLoading = true;

                await Future.delayed(const Duration(seconds: 2));

                Navigator.pushReplacementNamed(context, 'home');
                loginForm.isLoading = false;
              }
            
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            color: Colors.purple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                      loginForm.isLoading ? 'Espere...'
                      : 'Ingresar', 
                      style: TextStyle(color: loginForm.isLoading ? Colors.black : Colors.white)),),
            ),
        ],
      )
      );
  }
}