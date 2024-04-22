import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_6/pages/discount_page.dart';
import 'package:task_6/pages/gift_page.dart';
import 'package:task_6/pages/home_page.dart';
import 'package:task_6/pages/list_comments.dart';
import 'package:task_6/pages/product_page.dart';
import 'package:task_6/pages/shop_page.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/shop';

  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _rootNavigationShop =
      GlobalKey<NavigatorState>(debugLabel: 'shellShop');
  static final _rootNavigationGift =
      GlobalKey<NavigatorState>(debugLabel: 'shellGift');
  static final _rootNavigationDiscount =
      GlobalKey<NavigatorState>(debugLabel: 'shellDiscount');
  static final _rootNavigationReview =
      GlobalKey<NavigatorState>(debugLabel: 'shellReview');

  static final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initR,
      navigatorKey: _rootNavigationKey,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return HomePage(
                navigationShell: navigationShell,
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(navigatorKey: _rootNavigationShop, routes: [
                GoRoute(
                    path: '/shop',
                    name: 'Shop',
                    builder: (context, state) {
                      return ShopPage(
                        key: state.pageKey,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'product',
                        name: 'Product',
                        builder: (context, state) {
                          return ProductPage(
                            key: state.pageKey,
                          );
                        },
                      )
                    ])
              ]),
              StatefulShellBranch(navigatorKey: _rootNavigationGift, routes: [
                GoRoute(
                    path: '/gift',
                    name: 'Gift',
                    builder: (context, state) {
                      return GiftPage(
                        key: state.pageKey,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'info',
                        name: 'Info',
                        builder: (context, state) {
                          return ProductPage(
                            key: state.pageKey,
                          );
                        },
                      )
                    ])
              ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigationDiscount,
                  routes: [
                    GoRoute(
                      path: '/discount',
                      name: 'Discount',
                      builder: (context, state) {
                        return DiscountPage(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(navigatorKey: _rootNavigationReview, routes: [
                GoRoute(
                  path: '/review',
                  name: 'Review',
                  builder: (context, state) {
                    return ListComments(
                      key: state.pageKey,
                    );
                  },
                )
              ]),
            ])
      ]);
}
