import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';

import '../state/dashboard_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return ListView.builder(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          itemCount: provider.topProducts.length,
          itemBuilder: (BuildContext context, int index) {
            final data = provider.topProducts[index];
            return Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[
                  AppColor.cardbg,
                  AppColor.bgcolor,
                ],
                  begin: Alignment.topRight,
                  end:Alignment.bottomLeft,

                ),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color:  AppColor.boder,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(data.image, width: 60, height: 60),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            'Product name',
                            style: TextStyle(
                              color: AppColor.fadetextcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.name,
                            style: TextStyle(
                              color: AppColor.textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product id',
                            style: TextStyle(
                              color: AppColor.fadetextcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           Text(
                            data.productId,
                            style: TextStyle(
                              color: AppColor.textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product price',
                            style: TextStyle(
                              color: AppColor.fadetextcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           Text(
                            '${data.price}',
                            style: TextStyle(
                              color: AppColor.textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qty',
                            style: TextStyle(
                              color: AppColor.fadetextcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           Text(
                            '${data.quantity}',
                            style: TextStyle(
                              color: AppColor.textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: AppColor.fadetextcolor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           Text(
                            data.status,
                            style: TextStyle(
                              color: AppColor.textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
