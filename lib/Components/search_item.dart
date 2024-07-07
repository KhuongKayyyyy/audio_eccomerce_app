import 'package:audio_ecommerce_app/Views/explore_product.dart';
import 'package:flutter/material.dart';
class SearchItem extends StatelessWidget{
  String searchedItem;
  SearchItem({super.key, required this.searchedItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExploreProduct(type: "search",searchContent: searchedItem,))
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.watch_later_outlined,
            color: Colors.grey,
          ),
          const SizedBox(width: 15,),
          Text(
            searchedItem,
          ),
          const Spacer(),
          IconButton(onPressed: (){}, icon: const Icon(Icons.highlight_remove_rounded)),
        ],
      ),
    );
  }
}