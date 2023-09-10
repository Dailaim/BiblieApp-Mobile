import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  final GoRouter router;

  const NavBar({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          gap: 8,
          activeColor: theme.colorScheme.secondary,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: theme.colorScheme.primaryContainer,
          color: theme.iconTheme.color,
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              onPressed: () => router.go('/'),
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Favoritos',
              onPressed: () => router.go('/favorites'),
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Buscar',
              onPressed: () => router.go('/search'),
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Perfil',
              onPressed: () => router.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }
}
