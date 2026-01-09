import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/dashboard_provider.dart';
import 'package:sure_fire_hire/widgets/product_card.dart';
import '../widgets/manage_card.dart';
import '../widgets/normal_appbar.dart';

class ProductManageScreen extends StatefulWidget {
  const ProductManageScreen({super.key});
  static const String route = '/ProductManageScreen';
  @override
  State<ProductManageScreen> createState() => _ProductManageScreenState();
}

class _ProductManageScreenState extends State<ProductManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF4E8DD), Color(0xFFE1DFDF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ManageCard(
                  title: 'Manage Products',
                  subtitle: 'You can view and edit products from here',
                  image: 'assets/images/Group 309.png',
                ),
                Consumer<DashboardProvider>(
                  builder: (BuildContext context, provider, Widget? child) {
                    return ProductCard(
                      showActions: true,
                      extradata: true,
                      products: provider.manageProducts,
                      direction: Axis.vertical,
                      useGradient: false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Color(0xFFF8B582), Color(0xFFF27B21)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {},
          child: SvgPicture.asset(
            'assets/icons/add-square.svg',
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
