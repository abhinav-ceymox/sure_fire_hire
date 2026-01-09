import 'package:flutter/material.dart';
import 'package:sure_fire_hire/models/order_model.dart';

class OrderProvider extends ChangeNotifier {

  final List<OrderModel> _order=[
    OrderModel(
        productId: '#124635GDGDG245',
        billingName: 'Alpha ',
        grandTotal:   3245,
        commissionFee: 45,
        vendorPayment: 99,
        orderStatus: 'Paid',
        purchasedOn: '30 Oct 2025',
     ),
    OrderModel(
      productId: '#124635GDGDG245',
      billingName: 'Alpha ',
      grandTotal:   3245,
      commissionFee: 45,
      vendorPayment: 99,
      orderStatus: 'Paid',
      purchasedOn: '30 Oct 2025',
    ),
    OrderModel(
      productId: '#124635GDGDG245',
      billingName: 'Alpha ',
      grandTotal:   3245,
      commissionFee: 45,
      vendorPayment: 99,
      orderStatus: 'Paid',
      purchasedOn: '30 Oct 2025',
    ),
    OrderModel(
      productId: '#124635GDGDG245',
      billingName: 'Alpha ',
      grandTotal:   3245,
      commissionFee: 45,
      vendorPayment: 99,
      orderStatus: 'Paid',
      purchasedOn: '30 Oct 2025',
    ),

  ];

  List<OrderModel> get order => _order;
}