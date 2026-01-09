import 'package:go_router/go_router.dart';
import 'package:sure_fire_hire/views/home.dart';
import 'package:sure_fire_hire/views/onboard_Screen.dart';

import '../views/order_manage_screen.dart';
import '../views/product_manage.dart';
import '../views/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path:OnboardScreen.route ,
      name:OnboardScreen.route ,
      builder: (context, state) => const OnboardScreen(),
    ),

    GoRoute(
      path: SellerDashboardScreen.route,
      name: SellerDashboardScreen.route,
      builder: (context, state) => const SellerDashboardScreen(),

      routes: [
        GoRoute(
          path: ProductManageScreen.route,
          name: ProductManageScreen.route,
          builder: (context, state) => const ProductManageScreen(),
        ),
        GoRoute(
          path: OrderManageScreen.route,
          name: OrderManageScreen.route,
          builder: (context, state) => const OrderManageScreen(),
        ),
      ]
    ),




  ],
);
