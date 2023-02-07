import 'package:flutter/material.dart';
import 'package:pokedex_pokeapi/ui/pages/home_page/sections/pokemon_data/tabs/about/components/description_card/description_card_shape.dart';

class DescriptionCard extends StatelessWidget {
  //final int index;
  final String text;
  const DescriptionCard({
    Key? key,
    //required this.index,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: 24,
            alignment: Alignment.center,
            child: Text(
              index.toString(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),*/
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 8,
            ),
            child: CustomPaint(
              painter: DescriptionCardShape(
                fillColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
