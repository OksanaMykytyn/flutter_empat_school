import 'package:flutter/material.dart';

class AboutPhoto extends StatelessWidget {
  const AboutPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x003426cf)
                      .withOpacity(0.2), // Shadow color with opacity
                  offset: const Offset(0, 0), // Shadow offset (x, y)
                  blurRadius: 12.0, // Shadow blur radius
                  spreadRadius: 4.0, // Shadow spread radius
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const Image(
                  image: AssetImage('images/comics.png'),
                  height: 300,
                )),
          ),
        ],
      ),
    );
  }
}
