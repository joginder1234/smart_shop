import 'package:flutter/cupertino.dart';
import 'package:smart_shop/classes/basic_models.dart';

class AppDataProvider extends ChangeNotifier {
  /* Address Provider and Handlers */
  List<AddressModel> _address = [];
  List<AddressModel> get getAddressList => _address;
  addNewAddress(AddressModel newAddress) {
    _address.add(newAddress);
    notifyListeners();
  }

  removeAddress(String id) {
    _address.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  /* */
}
