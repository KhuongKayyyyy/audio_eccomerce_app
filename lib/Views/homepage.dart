import 'package:audio_ecommerce_app/Components/homepage_featured_product.dart';
import 'package:audio_ecommerce_app/Components/homepage_product.dart';
import 'package:audio_ecommerce_app/Components/search_bar_custom.dart';
import 'package:audio_ecommerce_app/Data/fake_data.dart';
import 'package:audio_ecommerce_app/Models/product.dart';
import 'package:audio_ecommerce_app/Views/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = -1; // Initial selected index
  List<Product> products = FakeData.products;
  List<String> buttonTitles = ["Headphone", "Earphones", "Speakers", "Microphones"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list),
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.audiotrack,
                  color: Theme.of(context).primaryColor,
                ),
                const Text(
                  "Audio",
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile())
                );
              },
              child:SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: FakeData.systemUser.imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Hi ${FakeData.systemUser.name}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "What are you looking for today?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SearchBarCustom(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SingleChildScrollView(
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
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index){
                          Product product = products.elementAt(index);
                          return Padding(
                            padding:const EdgeInsets.all(10),
                            child: HomepageProduct(product: product,),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        const Text(
                            "Featured Products",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                          ),
                        ),
                        const Spacer(),
                        TextButton(onPressed: (){},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: Colors.grey[600]!,
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 215,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context,index){
                          Product product = products.elementAt(index);
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: HomepageFeaturedProduct(product: product,),
                          );
                        }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}