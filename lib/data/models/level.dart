/// уровни партнёрской программы
enum LevelCode { first, second, third }

/// [LevelCode] код уровня
/// [percent] процент начисления бонусов
class Level {
  final String title;
  final String description;
  final LevelCode levelCode;
  final int percent;

  Level({
    required this.title,
    required this.description,
    required this.levelCode,
    required this.percent,
  });
}
