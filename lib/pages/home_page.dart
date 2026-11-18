import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Duffkie'),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/signup'),
              child: const Text('Sign Up'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/login'),
              child: const Text('Login'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}