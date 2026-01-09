import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/state/order_provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/widgets/manage_card.dart';
import 'package:sure_fire_hire/widgets/normal_appbar.dart';

class OrderManageScreen extends StatefulWidget {
  const OrderManageScreen({super.key});
  static const String route = '/OrderManageScreen';

  @override
  State<OrderManageScreen> createState() => _OrderManageScreenState();
}

class _OrderManageScreenState extends State<OrderManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF4E8DD), Color(0xFFE1DFDF)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  children: [
                    ManageCard(
                      title: 'Manage Orders',
                      subtitle: 'You can view all your orders from here',
                      image: 'assets/images/Group 309 (2).png',
                      message: true,
                    ),
                     Consumer<OrderProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: provider.order.length,
                          itemBuilder: (BuildContext context, int index) {
                            final order=provider.order[index];
                            return Container(
                              margin: const EdgeInsets.all(28),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: AppColor.bgcolor,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// ORDER ID
                                  Text(
                                    'Order ID',
                                    style: TextStyle(
                                      color: AppColor.fadetextcolor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    order.productId,
                                    style:  TextStyle(
                                      color: AppColor.secondary ,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  /// BILLING NAME
                                  Text(
                                    'Billing Name',
                                    style: TextStyle(
                                      color: AppColor.fadetextcolor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    order.billingName,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                  const SizedBox(height: 26),

                                  /// ROW 1
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _info(
                                        'Grand Total',
                                        '\$ ${order.grandTotal.toStringAsFixed(0)}',
                                      ),
                                      _info(
                                        'Commission Fee',
                                        '\$ ${order.commissionFee.toStringAsFixed(0)}',
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  /// ROW 2
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _info(
                                        'Vendor Payment',
                                        '\$ ${order.vendorPayment.toStringAsFixed(0)}',
                                      ),
                                      _info(
                                        'Order Status',
                                        order.orderStatus,
                                        bold: true,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 24),

                                  /// PURCHASED DATE
                                  Text(
                                    'Purchased On',
                                    style: TextStyle(
                                      color: AppColor.fadetextcolor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${order.purchasedOn}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _info(String label, String value, {bool bold = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(color: AppColor.fadetextcolor)),
      const SizedBox(height: 6),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    ],
  );
}
