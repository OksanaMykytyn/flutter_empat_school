import 'package:create_box/components/for_content_of_page/buttons/my_blue_button.dart';
import 'package:create_box/features/bestseller_page/bestseller_page.dart';
import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:flutter/material.dart';

class MyCardBestseller extends StatelessWidget {
  final Box box;

  const MyCardBestseller({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFDF2DD)
            .withOpacity(0.5), // background: rgba(255, 242, 221, 0.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const Image(image: AssetImage('images/bestseller_box.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  box.name,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Text(
            'Wrapping: ${box.wrapper.name}',
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              'Comics: ${box.comics.map((e) => e.name).join(", ")}',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Text(
            'Sweets: ${box.sweets.map((e) => e.name).join(", ")}',
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${box.price.toStringAsFixed(2)} \$',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyBlueButton(
                  title: 'ORDER',
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BestsellerPage(box: box),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
