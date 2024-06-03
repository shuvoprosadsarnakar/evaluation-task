import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screen/home/home_screen.dart';
import 'package:myapp/screen/login/signin_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      name: 'signin',
      builder: (context, state) {
        return SigninScreen();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) =>
      ErrorScreen(state.error!),
);

/// The screen of the error page.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {super.key});
  final Exception error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(error.toString()),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      );
}
