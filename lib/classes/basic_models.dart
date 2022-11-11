class MyBottomBarItems {
  String icon, title;
  MyBottomBarItems(this.icon, this.title);
}

class CategoryClass {
  String image, title;
  CategoryClass(this.image, this.title);
}

class AccountBtnClass {
  String icon, title;
  AccountBtnClass(this.icon, this.title);
}

class CatalogClass {
  String title;
  List<CategoryClass> items;
  CatalogClass(this.title, this.items);
}

class AddressModel {
  String id, location, houseNo, landmark, pincode, title;
  AddressModel(this.id, this.location, this.houseNo, this.landmark,
      this.pincode, this.title);
}
