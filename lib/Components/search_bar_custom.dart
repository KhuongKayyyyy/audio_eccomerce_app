import 'package:flutter/material.dart';
import '../Views/explore_product.dart';

class SearchBarCustom extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search headphone',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              String searchText = _searchController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExploreProduct(
                    type: 'search',
                    searchContent: searchText,
                  ),
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
