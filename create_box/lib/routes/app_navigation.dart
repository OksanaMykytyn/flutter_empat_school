import 'package:create_box/features/bestseller_page/bestseller_page.dart';
import 'package:create_box/features/cart_page/cart_page.dart';
import 'package:create_box/features/constructor_page/constructor_page.dart';
import 'package:create_box/features/home_page.dart';
import 'package:create_box/features/order_page/order_page.dart';
import 'package:create_box/features/product_page/product_page.dart';
import 'package:create_box/features/settings_page/settings_page.dart';
import 'package:create_box/features/shop_page/shop_page.dart';
import 'package:create_box/repository/bestsellers/models/box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/shop';

  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _rootNavigationShop =
      GlobalKey<NavigatorState>(debugLabel: 'shellShop');
  static final _rootNavigationSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
  static final _rootNavigationConstructor =
      GlobalKey<NavigatorState>(debugLabel: 'shellConstructor');
  static final _rootNavigationCart =
      GlobalKey<NavigatorState>(debugLabel: 'shellCart');
  static final _rootNavigationOrder =
      GlobalKey<NavigatorState>(debugLabel: 'shellOrder');
  static final _rootNavigationProduct =
      GlobalKey<NavigatorState>(debugLabel: 'shellProduct');
  static final _rootNavigationBestseller =
      GlobalKey<NavigatorState>(debugLabel: 'shellBestseller');

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
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'bestseller',
                        name: 'Bestseller',
                        builder: (context, state) {
                          final box = state.extra! as Box;
                          return BestsellerPage(
                            box: box,
                            key: _rootNavigationBestseller,
                          );
                        },
                      ),
                      GoRoute(
                          path: 'cart',
                          name: 'Cart',
                          builder: (context, state) {
                            return CartPage(
                              key: _rootNavigationCart,
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'order',
                              name: 'Order',
                              builder: (context, state) {
                                final int id = state.extra! as int;
                                return OrderPage(
                                  id: id,
                                  key: _rootNavigationOrder,
                                );
                              },
                            ),
                          ]),
                    ]),
              ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigationConstructor,
                  routes: [
                    GoRoute(
                        path: '/constructor',
                        name: 'Constructor',
                        builder: (context, state) {
                          return ConstructorPage(
                            key: state.pageKey,
                          );
                        },
                        routes: <RouteBase>[
                          GoRoute(
                            path: 'product',
                            name: 'Product',
                            builder: (context, state) {
                              final int id = state.extra! as int;
                              final String name = state.extra! as String;
                              final String description = state.extra! as String;
                              final double price = state.extra! as double;
                              final String photoPath = state.extra! as String;
                              final bool isComics = state.extra! as bool;
                              final bool isSweet = state.extra! as bool;
                              return ProductPage(
                                key: _rootNavigationProduct,
                                name: name,
                                id: id,
                                description: description,
                                photoPath: photoPath,
                                price: price,
                                isComics: isComics,
                                isSweet: isSweet,
                              );
                            },
                          ),
                        ])
                  ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigationSettings,
                  routes: [
                    GoRoute(
                      path: '/settings',
                      name: 'Settings',
                      builder: (context, state) {
                        return SettingsPage(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
            ])
      ]);
}
