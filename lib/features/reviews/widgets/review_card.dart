import 'package:cartivo_mart/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';


import '../../../app/app_colors.dart';

class reviewCard extends StatelessWidget {
  const reviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: .symmetric(horizontal: 16, vertical: 4),
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildTitleSection(context),
              SizedBox(height: 5),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person_outline, color: AppColors.themeColor),
        Text("Name hasan", style: context.textTheme.titleMedium),
      ],
    );
  }
}


