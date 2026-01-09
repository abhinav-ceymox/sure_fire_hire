import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/service/route_service.dart';
import 'package:sure_fire_hire/state/dashboard_provider.dart';
import 'package:sure_fire_hire/state/order_provider.dart';
import 'package:sure_fire_hire/state/overview_provider.dart';
import 'package:sure_fire_hire/state/seller_provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_)=>OverviewProvider()),
        ChangeNotifierProvider(create: (_) => SellerProvider(),),
        ChangeNotifierProvider(create: (_) => OrderProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
