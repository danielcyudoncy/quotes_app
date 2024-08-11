import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/profile_controller.dart';
import 'package:quotes_app/controllers/quote_controller.dart';
import 'package:quotes_app/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final QuotesController quotesController = Get.put(QuotesController());
  final ProfileController profileController = Get.find<ProfileController>();
  final ScrollController _scrollController = ScrollController();

  HomeScreen({super.key}) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !quotesController.isLoading.value) {
        quotesController.fetchQuotes(); // Trigger fetchQuotes only if not already loading
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final fullName = profileController.fullName.value;
          return Row(
            children: [
              profileController.profileImage.value.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: FileImage(
                        File(profileController.profileImage.value),
                      ),
                      radius: 20,
                    )
                  : const CircleAvatar(
                      backgroundImage: AssetImage('assets/default_profile.png'),
                      radius: 20,
                    ),
              const SizedBox(width: 10),
              Text('Welcome, $fullName'),
            ],
          );
        }),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (quotesController.quotes.isEmpty && !quotesController.isLoading.value) {
          return const Center(child: Text('No quotes available.'));
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search quotes...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (query) {
                    quotesController.searchQuotes(query);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: quotesController.quotes.length + (quotesController.isLoading.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < quotesController.quotes.length) {
                      var quote = quotesController.quotes[index];
                      return Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(quote.quote),
                          subtitle: Text(quote.author),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Optionally manage index state if needed
        onTap: (index) {
          if (index == 1) {
            Get.to(() => ProfileScreen());
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
