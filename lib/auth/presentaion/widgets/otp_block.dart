import 'package:flutter/material.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class OtpBlock extends StatelessWidget {
  const OtpBlock({super.key, required this.onTap, required this.blockNo});

  final Function onTap;
  final int blockNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 50,
      decoration: BoxDecoration(
        color: lightGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) {
            onTap(blockNo, value);
          },
          maxLength: 1,
          style: txtStyle(35, Colors.black87)
              .copyWith(fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.all(12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
