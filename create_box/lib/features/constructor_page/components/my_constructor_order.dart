import 'package:create_box/components/for_content_of_page/buttons/my_yellow_button_for_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class MyConstructorOrder extends StatelessWidget {
  const MyConstructorOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyYellowButtonForOrder(
              title: 'GO TO CART',
              function: () {
                context.goNamed('Cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
