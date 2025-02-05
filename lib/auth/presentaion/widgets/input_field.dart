import 'package:flutter/material.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputHintText,
    required this.textEditingController,
  });
  final String inputHintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, top: 8),
      height: 60,
      width: MediaQuery.of(context).size.width > 550
          ? MediaQuery.of(context).size.width / 4
          : double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: lightGrey.withOpacity(0.7)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueGrey.withOpacity(0.04),
            Colors.blueGrey.withOpacity(0.03),
            Colors.blueGrey.withOpacity(0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        // Center the TextField vertically
        child: TextFormField(
          validator: (value) {
            if (inputHintText == 'Username') {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Username must be atleast 8 characters long!';
              }
            }

            if (inputHintText == 'Email') {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Something wrong with your email address! 😂';
              }
            }

            if (inputHintText == 'Password') {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Guess what? The password is short! try a longer one';
              }
            }
            return null;
          },
          controller: textEditingController,
          keyboardType: inputHintText == 'Phone Number'
              ? TextInputType.number
              : inputHintText == 'Email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          maxLength: inputHintText == 'Username'
              ? 12
              : inputHintText == 'Phone Number'
                  ? 10
                  : inputHintText == 'Password'
                      ? 16
                      : null,
          style: txtStyle(18, Colors.black87).copyWith(
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            counterText: '',
            prefixText: inputHintText == 'Phone Number' ? '+91  ' : null,
            prefixStyle: txtStyle(
              18,
              Colors.black87,
            ).copyWith(
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            hintText: inputHintText,
            hintStyle: txtStyle(18, Colors.blueGrey.withOpacity(0.3))
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
