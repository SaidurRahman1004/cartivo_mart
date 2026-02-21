import 'package:cartivo_mart/app/extensions/utils_extension.dart';
import 'package:cartivo_mart/features/reviews/screens/review_add_Screen.dart';
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  static const String name = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  return reviewCard();
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: .only(
                  topLeft: .circular(16),
                  topRight: .circular(16),
                ),
                color: AppColors.themeColor.withAlpha(30),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Reviews (1000)',
                    style: context.textTheme.titleLarge,
                  ),
                  FloatingActionButton(onPressed: (){
                    Navigator.pushNamed(context, AddReviewScreen.name);
                  }, child: Icon(Icons.add),shape: CircleBorder(),backgroundColor: AppColors.themeColor,),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
