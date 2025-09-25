import 'package:gamebox/features/forbidden_sequel/forbidden_sequel.dart';
import 'package:gamebox/features/activation/activation.dart';
import 'package:gamebox/my_home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:web/web.dart';

GoRouter getAppRouter() {
  return GoRouter(
    initialLocation: '/activation',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          document.title = "Sac à dos de Aku";
          return const MyHomePage();
        },
      ),
      GoRoute(
        path: '/suite-interdite',
        builder: (context, state) {
          document.title = "La Suite Interdite";
          return const ForbiddenSequel();
        },
      ),
      GoRoute(
        path: '/activation',
        builder: (context, state) {
          document.title = "Activation";
          return const Activation();
        },
      ),
    ]
  );
}
