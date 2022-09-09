import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContinueButton extends StatelessWidget {
  Function? onPressed;
  ContinueButton({Key? key, required Function? onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 0, 50, 91);
            }
            return const Color.fromARGB(255, 188, 219, 245);
          },
        ),
      ),
      onPressed: () {
        onPressed;
      },
      // Continue button:
      child: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
