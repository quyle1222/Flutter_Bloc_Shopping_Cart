import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/auth/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [Input(), TextInformation()],
          )),
    ));
  }
}

class Input extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return TextField(
          controller: emailController,
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
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return TextField(
          controller: passwordController,
          onChanged: (value) => {
            context
                .read<AuthBloc>()
                .add(AuthChange(email: state.props!.id, password: value)),
          },
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        );
      }),
      const SizedBox(
        height: 10,
      ),
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return TextButton(
            onPressed: () => context.read<AuthBloc>().add(AuthLogin(
                auth: Auth(
                    id: state.props!.id, password: state.props!.password))),
            child: Container(
              padding: EdgeInsets.all(10),
              child: const Text('Login'),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ));
      }),
    ]);
  }
}

class TextInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Container(
        child: Text(state.isLogin.toString()),
      );
    });
  }
}
