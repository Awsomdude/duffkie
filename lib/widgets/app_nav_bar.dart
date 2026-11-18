import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AppNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
        onPressed: () => context.go('/'),
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
        ),
        child: const Text(
          'Duffkie',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Home'),
        ),
        TextButton(
          onPressed: () => context.go('/settings'),
          child: const Text('Settings'),
        ),
      ],
    );
  }
}