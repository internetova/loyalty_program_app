import 'dart:math';

/// прочие вспомогательные функции
class OtherUtils {
  OtherUtils._();

  /// рандомное число заданного промежутка
  static int getRandom(int min, int max) {
    final random = Random();

    return min + random.nextInt(max - min);
  }
}
