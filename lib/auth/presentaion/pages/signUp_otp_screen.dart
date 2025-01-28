import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone/auth/presentaion/widgets/otp_block.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class SignupOtpScreen extends StatelessWidget {
  SignupOtpScreen({super.key});

  Map<int, String> otpMap = {
    1: '',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
  };
  
  void ontap(int blockno, String? otpDigit) {
    if (otpDigit == null) return;
    otpMap[blockno] = otpDigit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(50),
            Text(
              'OTP Sent to abc********@gmail.com',
              softWrap: true,
              textAlign: TextAlign.center,
              style: txtStyle(
                22,
                lightGrey,
              ).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 1; i <= 6; i++)
                  OtpBlock(
                    onTap: ontap,
                    blockNo: i,
                  ),
              ],
            ),
            const Gap(30),
            InkWell(
              onTap: () {
                log(otpMap.values.toString());
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 17, 148, 255),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: txtStyle(
                      18,
                      Colors.white,
                    ).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
