import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
