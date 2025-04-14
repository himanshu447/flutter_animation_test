import 'dart:math';
import 'dart:ui';

class ColorHelper {
  static Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // opacity
      random.nextInt(256), // red
      random.nextInt(256), // green
      random.nextInt(256), // blue
    );
  }
}
