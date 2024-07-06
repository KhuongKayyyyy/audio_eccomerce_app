import 'package:audio_ecommerce_app/Components/feature_item.dart';
import 'package:audio_ecommerce_app/Components/homepage_featured_product.dart';
import 'package:audio_ecommerce_app/Components/primary_button.dart';
import 'package:audio_ecommerce_app/Data/fake_data.dart';
import 'package:audio_ecommerce_app/Models/feature.dart';
import 'package:audio_ecommerce_app/Views/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audio_ecommerce_app/Models/product.dart';
import 'package:audio_ecommerce_app/Components/review_item.dart';
import 'package:audio_ecommerce_app/Models/review.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Product> products = FakeData.products;
  int selectedIndex = 0;
  bool showAllReviews = false;

  @override
  Widget build(BuildContext context) {
    // Determine which reviews to display based on showAllReviews flag
    List<Review>? displayedReviews = showAllReviews ? widget.product.reviews : widget.product.reviews?.take(2).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => ShoppingCart()));
          }, icon:const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //general information
                  Text(
                    "USD ${widget.product.price}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Navigation bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                color: selectedIndex == 0 ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          if (selectedIndex == 0)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Features",
                              style: TextStyle(
                                color: selectedIndex == 1 ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          if (selectedIndex == 1)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Specification",
                              style: TextStyle(
                                color: selectedIndex == 2 ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                          if (selectedIndex == 2)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),

                  //image section
                  if (selectedIndex == 0) ...[
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: widget.product.imageUrls.elementAt(index),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //review section
                    const SizedBox(height: 30),
                    Text(
                      "Review (${widget.product.reviews?.length ?? 0})",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: displayedReviews?.length ?? 0,
                              itemBuilder: (context, index) {
                                // Safely handle the nullable Review
                                Review? review = displayedReviews?[index];
                                if (review == null) {
                                  return const SizedBox.shrink(); // Return an empty widget if the review is null
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: ReviewItem(review: review),
                                );
                              },
                            ),
                          ),
                          if (widget.product.reviews != null && widget.product.reviews!.length > 2)
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showAllReviews = !showAllReviews;
                                  });
                                },
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                                ),
                                child: Text(
                                  showAllReviews ? 'Show less Reviews' : 'Show all Reviews',
                                  style: const TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]
                ],
              ),
            ),

            //overview
            if(selectedIndex == 0) ...[
              Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Another Product",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          TextButton(onPressed: (){},
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 180, // Adjust height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: HomepageFeaturedProduct(product: products[index]),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(btnText: "Add to Cart", onPressed: (){}),
              ),
              const SizedBox(height: 40,),
            ],
          //  Features
            if(selectedIndex == 1)...[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Highly Detailed Audio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                        "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. "
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                        itemCount: widget.product.features.length,
                        itemBuilder: (builder, index){
                          Feature feature = widget.product.features.elementAt(index);
                          return Padding(
                            padding:const EdgeInsets.all(10),
                            child: FeatureItem(feature: feature,),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(btnText: "Add to Cart", onPressed: (){}),
              ),
              const SizedBox(height: 40,),
            ]
          ],
        )
      ),
    );
  }
}
