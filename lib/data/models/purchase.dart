/// данные по покупке
/// [id] id
/// [name] название
/// [cost] стоимость
/// [bonus] начисленные / списанные бонусы
/// [date] дата покупки
class Purchase {
  final int? id;
  final String name;
  final double cost;
  final int bonus;
  final DateTime date;

  Purchase({
    this.id,
    required this.name,
    required this.cost,
    required this.bonus,
    required this.date,
  });
}