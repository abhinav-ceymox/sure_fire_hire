import 'package:flutter/cupertino.dart';
import 'package:sure_fire_hire/models/seller_model.dart';

class SellerProvider extends ChangeNotifier {

SellerModel _seller=SellerModel(
  name: 'Seller Name',
    role: 'Vendor',
);

SellerModel get seller => _seller;


}