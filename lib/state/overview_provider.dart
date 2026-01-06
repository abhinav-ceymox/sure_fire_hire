import 'package:flutter/material.dart';
 import '../models/chart_model.dart';
import '../models/product_status_model.dart';


class OverviewProvider extends ChangeNotifier {
  // PRODUCT STATUS DATA
  final List<ProductStatus> _productStatusList = [
    ProductStatus(label: "Approved", count: 60, color: Colors.orange),
    ProductStatus(label: "Pending", count: 25, color: Colors.blue),
    ProductStatus(label: "Rejected", count: 15, color: Colors.black),
  ];

  List<ProductStatus> get productStatusList => _productStatusList;

  // MONTHLY OVERVIEW DATA
  final List<MonthlyOverview> _monthlyOverview = [
    MonthlyOverview(month: "Jan", income: 10000, expense: 20000),
    MonthlyOverview(month: "Feb", income: 22000, expense: 29000),
    MonthlyOverview(month: "Mar", income: 26000, expense: 28000),
    MonthlyOverview(month: "Apr", income: 28000, expense: 23000),
    MonthlyOverview(month: "Jun", income: 30000, expense: 18000),
    MonthlyOverview(month: "Jul", income: 40000, expense: 20000),
  ];

  List<MonthlyOverview> get monthlyOverview => _monthlyOverview;
}
