import 'package:flutter/material.dart';
import 'package:flutterpractic/core/contexts/router_key.dart';
import 'package:flutterpractic/core/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends HookConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final routerKey = ref.watch(routerKeyProvider);
    final router = ref.read(goRouterProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          selectedIndex: routerKey,
          onTabChange: (index) =>
              ref.read(routerKeyProvider.notifier).state = index,
          gap: 6,
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
