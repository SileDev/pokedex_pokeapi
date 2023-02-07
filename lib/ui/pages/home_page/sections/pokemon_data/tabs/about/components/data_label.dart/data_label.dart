import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/utils/text/text_utils.dart';

class DataLabel extends StatelessWidget {
  final String label;
  final String value;
  const DataLabel({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: TextUtils().makeUpperCaseWord(text: "$label: "),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            TextSpan(
              text: value,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
