import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/counter/ui/counter_details_page.dart';
import '../features/system/ui/home_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/counter-details',
        name: 'counter-details',
        builder: (context, state) => const CounterDetailsPage(),
      ),
    ],
  );
});
