import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            "KinoPoisk",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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

          ElevatedButton(
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
