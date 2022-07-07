import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/auth/bloc/auth_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(title: const Text('Cart')),
            body: Container(
      padding: const EdgeInsets.all(10),
      child: Input(),
    )));
  }
}

class Input extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return TextField(
          onChanged: (value) => {
            context
                .read<AuthBloc>()
                .add(AuthChange(email: value, password: "")),
            print('state $state')
          },
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        );
      }),
      const SizedBox(
        height: 10,
      ),
      TextButton(
          onPressed: () => print("stat"),
          child: Container(
            padding: EdgeInsets.all(10),
            child: const Text('Login'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ))
    ]);
  }
}
