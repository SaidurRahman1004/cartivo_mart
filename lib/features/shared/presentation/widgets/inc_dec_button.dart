import 'package:cartivo_mart/app/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../app/extensions/utils_extension.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, this.width = 100, required this.onChange});

  final double width;
  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(mainAxisAlignment: .spaceBetween, children: [
        _buildIconButton(Icons.remove, (){
          if (_count > 1) {
            _count--;
            setState(() {});
            widget.onChange(_count);
          }

        }),
        Text('$_count',style: context.textTheme.titleLarge),
        _buildIconButton(Icons.add, (){
          _count++;
          widget.onChange(_count);
          setState(() {});
        })
      ]),
    );
  }

  //IconButton Incriment dec
  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    );
  }
}

