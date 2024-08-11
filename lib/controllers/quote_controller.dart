import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/quote_model.dart';

class QuotesController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    try {
      isLoading(true);
      final response = await Dio().get('https://dummyjson.com/quotes');
      if (response.statusCode == 200) {
        var quotesList = (response.data['quotes'] as List)
            .map((quote) => Quote.fromJson(quote))
            .toList();
        quotes.assignAll(quotesList);
      } else {
        Get.snackbar('Error', 'Failed to load quotes');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load quotes: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchQuotes(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      fetchQuotes(); // Optionally refetch quotes if clearing search
    } else {
      var filteredQuotes = quotes.where((quote) {
        return quote.quote.toLowerCase().contains(query.toLowerCase()) ||
            quote.author.toLowerCase().contains(query.toLowerCase());
      }).toList();
      quotes.assignAll(filteredQuotes);
    }
  }
}
