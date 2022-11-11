import 'package:smart_shop/classes/basic_models.dart';
import 'package:smart_shop/helpers/icons_and_image.dart';

List<CategoryClass> categories = [
  CategoryClass(AppImages.groceryCat, "Grocery"),
  CategoryClass(AppImages.fasionCat, "Fashion"),
  CategoryClass(AppImages.mobileCat, "Mobiles"),
  CategoryClass(AppImages.electCat, "Electronics"),
  CategoryClass(AppImages.kitchenCat, "Home & Kitchen"),
  CategoryClass(AppImages.jweleryCat, "Jewellery"),
  CategoryClass(AppImages.booksCat, "Books"),
  CategoryClass(AppImages.sportsCat, "Sports")
];

List<String> banners = [
  AppImages.bannerImage,
  AppImages.bannerImage2,
  AppImages.bannerImage3,
];

List<CatalogClass> subCategories = [
  CatalogClass("Your Daily Staples", [
    CategoryClass(AppImages.safolaImage, "Flour"),
    CategoryClass(AppImages.safolaImage, "Rice Products"),
    CategoryClass(AppImages.safolaImage, "Dry Fruits"),
    CategoryClass(AppImages.safolaImage, "Salt & Sugar"),
  ]),
  CatalogClass("Beverages", [
    CategoryClass(AppImages.safolaImage, "Juice"),
    CategoryClass(AppImages.safolaImage, "Health Drinks"),
    CategoryClass(AppImages.safolaImage, "Energy Drinks"),
    CategoryClass(AppImages.safolaImage, "Cofee & Tea"),
  ]),
  CatalogClass("Snacks Store", [
    CategoryClass(AppImages.safolaImage, "Namkeen"),
    CategoryClass(AppImages.safolaImage, "Soups and Noodles"),
    CategoryClass(AppImages.safolaImage, "Biscuits & Cookies"),
    CategoryClass(AppImages.safolaImage, "Nachos"),
  ]),
  CatalogClass("Cleaning & Household", [
    CategoryClass(AppImages.safolaImage, "Cleaners"),
    CategoryClass(AppImages.safolaImage, "Fabric Care"),
    CategoryClass(AppImages.safolaImage, "Kitchen Wipes"),
    CategoryClass(AppImages.safolaImage, "Freshners"),
  ])
];
