import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  final TextEditingController searchController;
  const HomeSearchField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search games...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
