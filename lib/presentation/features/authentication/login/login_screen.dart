import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  String? token;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loginForm(),

          // BlocConsumer<LoginBloc, LoginState>(
          //     listener: (context, state) {},
          //     builder: ((context, state) {
          //       return SafeArea(
          //           child: Column(
          //         children: [
          //           loginForm(),
          //         ],
          //       ));
          //     })),
        ],
      ),
    );
  }

  Widget loginForm() {
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: authField('Username', 'Please enter username!',
                      userNameController, true, true)),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: authField('Password', 'Please enter password!',
                      passwordController, true, true)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: (() async {
                            if (_formKey.currentState!.validate()) {}
                          }),
                          child: const Text('Login')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget authField(String hintText, String? errorMessage,
    TextEditingController controller, bool doValidate, bool editable) {
  if (doValidate) {
    return TextFormField(
      readOnly: !editable,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage ?? '';
        }
        return null;
      },
      controller: controller,
    );
  } else {
    return TextFormField(
      readOnly: !editable,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: hintText),
      controller: controller,
    );
  }
}
