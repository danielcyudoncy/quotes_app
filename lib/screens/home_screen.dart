import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/quote_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final QuotesController quotesController = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: quotesController.searchQuotes,
          decoration: const InputDecoration(hintText: "Search quotes..."),
        ),
      ),
      body: Obx(() {
        if (quotesController.quotes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: quotesController.quotes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(quotesController.quotes[index].text),
                subtitle: Text(quotesController.quotes[index].author),
              );
            },
          );
        }
      }),
    );
  }
}