import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Логин",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Пароль",
                ),
              ),
            ],
          ),

          FilledButton(
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(Colors.tealAccent),
            ),
            onPressed: () {
              print("Handle войти");
            },
            child: Text("Войти"),
          ),
        ],
      ),
    );
  }
}
