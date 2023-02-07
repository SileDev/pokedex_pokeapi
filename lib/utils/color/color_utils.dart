import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorUtils {
  //Obtener un color de una imagen de internet
  Future<Color> getColorFromNetworkImage(
    String imageUrl,
    bool isDarkTheme,
  ) async {
    //
    Color cardColor = Colors.grey;
    try {
      //
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );
      //
      if (paletteGenerator.dominantColor != null) {
        //
        if (isDarkTheme) {
          //
          cardColor = paletteGenerator.dominantColor!.color.withAlpha(500);
        } else {
          //
          cardColor = paletteGenerator.dominantColor!.color.withOpacity(0.25);
        }
      }
    } catch (error) {
      rethrow;
    }
    return cardColor;
  }
}
