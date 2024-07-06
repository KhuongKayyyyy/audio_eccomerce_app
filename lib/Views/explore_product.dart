import 'package:audio_ecommerce_app/Components/search_result_item.dart';
import 'package:audio_ecommerce_app/Views/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/fake_data.dart';
import '../Models/product.dart';

class ExploreProduct extends StatefulWidget {
  final String type;
  final String? searchContent;

  ExploreProduct({required this.type, this.searchContent});

  @override
  _ExploreProductState createState() => _ExploreProductState();
}

class _ExploreProductState extends State<ExploreProduct> {
  List<Product> popularProduct = FakeData.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCart()),
              );
            },
            icon: const Icon(CupertinoIcons.cart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          //search types
          if (widget.type == "search") ...[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search result for",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    widget.searchContent ?? "Not Found",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ],
              ),
            )
          ],
          if (widget.type == "menu_search") ...[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search result for",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    widget.searchContent ?? "Not Found",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ],
              ),
            )
          ],
          //  search filter
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.settings_input_composite_outlined),
                          SizedBox(width: 10),
                          Text("Filter"),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Popularity",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Newest",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Most Expensive",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  search result
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: popularProduct.length,
                  itemBuilder: (context, index) {
                    Product product = popularProduct.elementAt(index);
                    return SearchResultItem(product: product);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7, // Adjust as needed
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
