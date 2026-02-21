import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../category/presentation/screens/category_list_screen.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../../../wishlist/presentation/screens/wish_list_screen.dart';
import '../providers/main_nav_provider.dart';

class MainNavHolderScreen extends StatelessWidget {
  const MainNavHolderScreen({super.key});

  static const String name = '/main-nav-holder';
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context, mainNavProvider, _) {
        return Scaffold(
          body: _screens[mainNavProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: mainNavProvider.changeSelectedIndex,
            currentIndex: mainNavProvider.selectedIndex,
            selectedItemColor: AppColors.themeColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            elevation: 3,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
