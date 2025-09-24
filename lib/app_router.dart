import 'package:gamebox/features/forbidden_sequel/forbidden_sequel.dart';
import 'package:gamebox/my_home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:web/web.dart';

GoRouter getAppRouter() {
  return GoRouter(
    initialLocation: '/suite-interdite',
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
    ]
  );
}
