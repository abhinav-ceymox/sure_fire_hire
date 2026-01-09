import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:sure_fire_hire/models/top_product_model.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';

class ProductCard extends StatelessWidget {
  final bool showActions;
  final bool extradata;
  final List<TopProduct> products;
  final Axis direction;
  final bool useGradient;

  const ProductCard({
    super.key,
    this.showActions = false,
    this.extradata = false,
    required this.products,
    required this.direction,
    this.useGradient=true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: direction == Axis.horizontal
          ? (extradata || showActions ? 460 : 320)
          : null,
          child: ListView.builder(
            shrinkWrap: direction == Axis.vertical,
            physics: direction == Axis.vertical
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            scrollDirection:direction,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final data = products[index];
              return Container(
                width:340,
                margin: const EdgeInsets.all(26),
                 decoration: BoxDecoration(
                  gradient: useGradient
                      ? LinearGradient(
                    colors: [
                      AppColor.cardbg,
                      AppColor.bgcolor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                      : null,
                  color: useGradient ? null : AppColor.bgcolor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColor.boder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          /// ---------- HEADER ----------
                          Row(
                            children: [
                              Image.asset(
                                data.image,
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product name',
                                    style: TextStyle(
                                      color: AppColor.fadetextcolor,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
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

                          /// ---------- ROW 1 ----------
                          InfoRow(
                            leftLabel: 'Product id',
                            leftValue: data.productId,
                            rightLabel: 'Product price',
                            rightValue: '${data.price}',
                          ),

                          const SizedBox(height: 25),

                          /// ---------- ROW 2 ----------
                          InfoRow(
                            leftLabel: 'Product id',
                            leftValue: data.productId,
                            rightLabel: 'Product price',
                            rightValue: '${data.price}',
                          ),


                          /// ---------- SKU + TYPE (OPTIONAL) ----------
                          if (extradata && data.sku != null && data.type != null) ...[
                            const SizedBox(height: 25),
                            InfoRow(
                              leftLabel: 'SKU',
                              leftValue: data.sku!,
                              rightLabel: 'Type',
                              rightValue: data.type!,
                            ),
                          ],
                        ],
                      ),
                    ),



                    /// ---------- ACTIONS (OPTIONAL) ----------
                    if (showActions) ...[
                      const SizedBox(height: 20),
                       Container(
                         decoration: BoxDecoration(
                           border: Border(
                             top: BorderSide(
                               color: Color(0xffD9D9D9),
                               width: 2,
                             )
                           )
                         ),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                        color: Color(0xffD9D9D9),
                                        width: 2,
                                      )
                                  )
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/pencil-edit-01.svg'),
                                  TextButton(
                                    onPressed: () {},
                                    child:  Text('Edit',
                                      style:TextStyle(color:AppColor.fadetextcolor) ,
                                    ),
                                  ),
                                  SizedBox(width: 50,)
                                ],
                              ),
                            ),
                             Row(
                              children: [
                                SvgPicture.asset('assets/icons/delete-02.svg'),
                                TextButton(
                                  onPressed: () {},
                                  child:Text(
                                    'Delete',
                                    style: TextStyle(color:AppColor.secondary ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                                               ),
                       ),
                    ],
                  ],
                ),
              );
            },
          ),
        );

  }
}
class InfoRow extends StatelessWidget {
  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;

  const InfoRow({
    super.key,
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              leftLabel,
              style: TextStyle(color: AppColor.fadetextcolor),
            ),
            Text(
              leftValue,
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
              rightLabel,
              style: TextStyle(color: AppColor.fadetextcolor),
            ),
            Text(
              rightValue,
              style: TextStyle(
                color: AppColor.textcolor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}