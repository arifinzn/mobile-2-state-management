import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_pattern/bloc/login_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  final String sessionToken;
  const WelcomeScreen({required this.sessionToken, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome'),
            Text('Session Token:$sessionToken'),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(const ProsesLogout());
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
