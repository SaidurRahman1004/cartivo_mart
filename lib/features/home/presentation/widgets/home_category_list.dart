import 'package:cartivo_mart/features/shared/presentation/widgets/category_card.dar.dart';
import 'package:flutter/material.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (_, index) => CategoryCard(),
        separatorBuilder: (_,_) => const SizedBox(width: 12),
      ),
    );
  }
}
