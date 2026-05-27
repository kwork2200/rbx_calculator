enum TipIconType { lightbulb, gamepad }

class TipModel {
  final int id;
  final String title;
  final String content;
  final TipIconType iconType;

  TipModel({
    required this.id,
    required this.title,
    required this.content,
    this.iconType = TipIconType.lightbulb,
  });
}
