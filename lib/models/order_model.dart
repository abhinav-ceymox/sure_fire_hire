class OrderModel {
  final String productId;
  final String billingName;
  final double grandTotal;
  final double commissionFee;
  final double vendorPayment;
  final String orderStatus;
  final String  purchasedOn;

  OrderModel({
    required this.productId,
    required this.billingName,
    required this.grandTotal,
    required this.commissionFee,
    required this.vendorPayment,
    required this.orderStatus,
    required this.purchasedOn});

}