import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/features/auth/presentation/view/login_view.dart';
import 'package:qwiker_driver/features/onpoarding/view/onpoarding_view.dart';

import '../global_functions.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        if (isFirstTime ?? false) {
          return const OnBoardingView();
        } else {
          return const LogInView();
        }
      },
    ),
    GoRoute(
      path: '/LoginView',
      builder: (context, state) => const LogInView(),
    ),
  ]);
}
