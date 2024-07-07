import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audio_ecommerce_app/Components/filter_button.dart';
import 'package:audio_ecommerce_app/Components/primary_button.dart';
import 'package:audio_ecommerce_app/Components/search_result_item.dart';
import 'package:audio_ecommerce_app/Views/shopping_cart.dart';

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
  int selectedIndex = -1; // Initial selected index
  List<Product> popularProduct = FakeData.products;
  List<String> buttonTitles = ["Headphone", "Earphones", "Speakers", "Microphones"];

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
          // Search types
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
          // Search filter
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.62, // Adjust the height as needed
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Modal head
                                    Row(
                                      children: [
                                        const Text(
                                          "Filter",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    // Modal body
                                    const SizedBox(height: 15),
                                    const Text(
                                      "Category",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 15),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: List.generate(4, (index) {
                                          return Container(
                                            height: 40,
                                            margin: const EdgeInsets.symmetric(horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: selectedIndex == index
                                                  ? Theme.of(context).primaryColor
                                                  : Colors.transparent,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  selectedIndex = index;
                                                });
                                              },
                                              child: Text(
                                                buttonTitles[index],
                                                style: TextStyle(
                                                  color: selectedIndex == index
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    const Text(
                                      "Sort by",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 15),
                                    // Filter buttons
                                    Row(
                                      children: [
                                        FilterButton(filterType: "Popularity"),
                                        const SizedBox(width: 15),
                                        FilterButton(filterType: "Newest"),
                                        const SizedBox(width: 15),
                                        FilterButton(filterType: "Oldest"),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        FilterButton(filterType: "High Price"),
                                        const SizedBox(width: 15),
                                        FilterButton(filterType: "Low Price"),
                                        const SizedBox(width: 15),
                                        FilterButton(filterType: "Review"),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    const Text("Price Range"),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300]!,
                                                    width: 2),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                "Min Price",
                                                style: TextStyle(color: Colors.grey[300]!),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300]!,
                                                    width: 2),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                "Max Price",
                                                style: TextStyle(color: Colors.grey[300]!),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: PrimaryButton(
                                        btnText: "Apply Filter",
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
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
          // Search result
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
