import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/utils/text/text_utils.dart';

class PokemonDataSection extends StatelessWidget {
  final String sectionName;
  final Widget sectionContent;
  const PokemonDataSection({
    Key? key,
    required this.sectionName,
    required this.sectionContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: Text(
              TextUtils().makeUpperCaseWord(text: sectionName),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: sectionContent,
            ),
          ),
        ],
      ),
    );
  }
}
