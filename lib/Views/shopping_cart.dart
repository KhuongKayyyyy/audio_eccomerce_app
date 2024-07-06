import 'package:audio_ecommerce_app/Components/cart_item.dart';
import 'package:flutter/material.dart';

import '../Data/fake_data.dart';
import '../Models/product.dart';
class ShoppingCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Product> products = FakeData.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){
                Product product = products.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: CartItem(product: product,),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Total ${products.length} items",
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text("USD ${calculateTotalValue(products)}",style: const TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child:const Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Proceed to Checkout",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                        Spacer(),
                        Text(">",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                        SizedBox(width: 40,),
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
          const SizedBox(height: 30,)
        ],
      )
    );
  }
  double calculateTotalValue(List<Product> products) {
    double total = 0.0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }
}