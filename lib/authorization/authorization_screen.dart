import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/authorization/cubit/authorization_cubit.dart';

class AuthorizationScreen extends StatelessWidget {
  AuthorizationScreen({super.key});

  String login = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationCubit, AuthorizationState>(
      builder: (context, state) {
        switch (state) {
          case AuthorizationState.login:
            return getLoginWidget(context);
          case AuthorizationState.entered:
            // TODO: go to moviesList screen
            print("enter flow");
            return Text("enter flow");
          case AuthorizationState.error:
            // TODO: handle
            return Text("error flow");
        }
      },
    );
  }

  Padding getLoginWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            "KinoPoisk",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),

          Column(
            spacing: 16,
            children: [
              getTextField("Логин", (value) {
                login = value;
              }),
              getTextField("Пароль", (value) {
                password = value;
              }),
            ],
          ),

          FilledButton(
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(Colors.tealAccent),
            ),
            onPressed: () =>
                context.read<AuthorizationCubit>().signIn(login, password),
            child: Text("Войти"),
          ),
        ],
      ),
    );
  }

  TextField getTextField(String placeholder, Function(String) onChanged) {
    return TextField(
      style: TextStyle(),

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        // hintStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
        labelText: placeholder,
        floatingLabelStyle: TextStyle(color: Colors.tealAccent),
      ),
      onChanged: onChanged,
    );
  }
}
