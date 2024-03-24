import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_4/item/product.dart';
import 'package:task_4/pages/item.dart';
import 'package:task_4/widget/navigation_drawer.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MyNavigationDrawer(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemSneakers(product: product,)),),
            child: Padding(
              padding: const EdgeInsets.symmetric( vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 254, 218),
    
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: product,
                        child: Image(image: AssetImage(product.assets),
                        height: 100,
                        width: 100,),),
                      const SizedBox(width: 16,),
                      Text('Product ${index+1}')
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        ),
    );
  }
}