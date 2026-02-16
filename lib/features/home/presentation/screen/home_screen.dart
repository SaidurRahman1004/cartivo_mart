import 'package:cartivo_mart/app/app_colors.dart';
import 'package:cartivo_mart/features/home/presentation/widgets/app_bar_icon_button.dart';
import 'package:cartivo_mart/features/home/presentation/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/assets_pats.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_slider.dart';
import '../widgets/horizontal_product_list_view.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              HomeSlider(),
              const SizedBox(height: 16),
              SectionHeader(name: 'Categories', onTapSeeAll: () {}),
              HomeCategoryList(),
              SectionHeader(name: 'Popular', onTapSeeAll: () {}),
              HorizontalProductListView(),
              SectionHeader(name: 'Special', onTapSeeAll: () {}),
              HorizontalProductListView(),
              SectionHeader(name: 'New', onTapSeeAll: () {}),
              HorizontalProductListView(),
        
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPats.navLogoSvg, width: 24, height: 24),
      actions: [
        AppBarIconButton(icon: Icons.person, onTap: () {}),
        const SizedBox(width: 4),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 4),
        AppBarIconButton(icon: Icons.notification_add_outlined, onTap: () {}),
      ],
    );
  }
}
