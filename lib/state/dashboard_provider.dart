import 'package:flutter/material.dart';
import '../models/dashboard_card_model.dart';
import '../models/top_product_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<DashboardStat> _stats = [
    DashboardStat(
        title: "Net Earned",
        value: 8540.50,
        icon: "assets/icons/cash-02.svg"),
    DashboardStat(
        title: "Pending Amount",
        value: 4691.30,
        icon: "assets/icons/delivery-box-01.svg"),
    DashboardStat(
        title: "Sold Products",
        value: 138,
        icon: "assets/icons/package-moving.svg"),
    DashboardStat(
        title: "Order Placed",
        value: 207,
        icon: "assets/icons/wallet-03.svg"),
  ];

  List<DashboardStat> get stats => _stats;

  final List<TopProduct> _topProducts = [
    TopProduct(
      name: "Professional Drill",
      productId: "#20478ERD",
      price: 105.50,
      quantity: 20,
      status: "In stock",
      image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
    ),
    TopProduct(
      name: "Professional Drill",
      productId: "#20478ERD",
      price: 105.50,
      quantity: 20,
      status: "In stock",
      image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
    ),
    TopProduct(
      name: "Professional Drill",
      productId: "#20478ERD",
      price: 105.50,
      quantity: 20,
      status: "In stock",
      image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
    ),

    TopProduct(
      name: "Professional Drill",
      productId: "#20478ERD",
      price: 105.50,
      quantity: 20,
      status: "In stock",
      image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
      sku:'8098765',
      type: 'sales'
    ),
    TopProduct(
        name: "Professional Drill",
        productId: "#20478ERD",
        price: 105.50,
        quantity: 20,
        status: "In stock",
        image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
        sku:'8098765',
        type: 'sales'
    ),
    TopProduct(
        name: "Professional Drill",
        productId: "#20478ERD",
        price: 105.50,
        quantity: 20,
        status: "In stock",
        image: 'assets/images/b62f945894293d3fd31eb810f7fa3bd36ac1c57c.png',
        sku:'8098765',
        type: 'sales'
    ),



  ];

  List<TopProduct> get topProducts => _topProducts;

  List<TopProduct> get dashboardProducts =>
      _topProducts.where((p) => p.sku == null && p.type == null).toList();

   List<TopProduct> get manageProducts =>
      _topProducts.where((p) => p.sku != null && p.type != null).toList();



}
