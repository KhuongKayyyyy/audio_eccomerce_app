import 'package:audio_ecommerce_app/Components/popular_product_item.dart';
import 'package:audio_ecommerce_app/Components/search_bar_custom.dart';
import 'package:audio_ecommerce_app/Components/search_item.dart';
import 'package:audio_ecommerce_app/Data/fake_data.dart';
import 'package:audio_ecommerce_app/Views/shopping_cart.dart';
import 'package:flutter/material.dart';

import '../Models/product.dart';

class Search extends StatelessWidget{
  List<Product> popularProduct = FakeData.products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold
        ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarCustom(),
            const SizedBox(height: 20,),
            const Text(
              "Latest Search",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17
              ),
            ),
            SearchItem(seachedItem: "SONY WH-1000XM5"),
            SearchItem(seachedItem: "APPLE AIRPODS MAX"),
            const SizedBox(height: 20,),
            const Text(
              "Popular Product",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: popularProduct.length,
                itemBuilder: (context, index){
                  Product product = popularProduct.elementAt(index);
                  return Padding(
                    padding:const EdgeInsets.symmetric(vertical: 10),
                    child: PopularProductItem(product: product,),
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}