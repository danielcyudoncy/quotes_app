import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
    required option,
  });
  final String text;
  final int index;
  final int questionId;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
              text: '${index + 1}. ',
              style: Theme.of(context).textTheme.headlineLarge,
              children: [
                TextSpan(
                    text: text,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            )),
            Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.blue),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
