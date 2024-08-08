import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:quotes_app/models/quote_model.dart';

class QuotesController extends GetxController {
  var quotes = <Quote>[].obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      var response = await _dio.get('https://dummyjson.com/quotes');
      quotes.value = (response.data['quotes'] as List).map((q) => Quote.fromJson(q)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void searchQuotes(String query) {
    var filteredQuotes = quotes.where((quote) => quote.text.toLowerCase().contains(query.toLowerCase())).toList();
    quotes.value = filteredQuotes;
  }
}
