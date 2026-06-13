import 'package:get/get.dart';

class FilterController extends GetxController {

  RxList<String> selectedPrice = <String>[].obs;
  RxList<String> selectedStars = <String>[].obs;
  RxList<String> selectedTags = <String>[].obs;
  RxList<String> selectedRatings = <String>[].obs;

  final List<Map<String, String>> priceList = [

    {
      "display": "₹0 - ₹1999",
      "value": "0-1999",
    },

    {
      "display": "₹2000 - ₹4000",
      "value": "2000-4000",
    },

    {
      "display": "₹4000 - ₹8000",
      "value": "4000-8000",
    },

    {
      "display": "₹8000 - ₹12000",
      "value": "8000-12000",
    },

    {
      "display": "₹10000+",
      "value": "10000-10000000",
    },

  ];

  final starList = [
    "5",
    "4",
    "3",
  ];

  final tagList = [
    "Couple Friendly",
    "Corporate Preferred",
    "Free WiFi",
  ];

  final ratingList = [
    {
      "display": "Excellent (4.5+)",
      "value": "4.5",
    },
    {
      "display": "Very Good (4.0+)",
      "value": "4.0",
    },
    {
      "display": "Good (3.5+)",
      "value": "3.5",
    }
  ];
}