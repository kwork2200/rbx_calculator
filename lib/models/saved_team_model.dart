class SavedTeamModel {
  final String id;
  final String name;
  final String formationName;
  final Map<String, String> playersBySpotId;

  const SavedTeamModel({
    required this.id,
    required this.name,
    required this.formationName,
    required this.playersBySpotId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'formationName': formationName,
      'playersBySpotId': playersBySpotId,
    };
  }

  factory SavedTeamModel.fromJson(Map<String, dynamic> json) {
    final raw = json['playersBySpotId'];
    final map = <String, String>{};

    if (raw is Map) {
      raw.forEach((k, v) {
        if (k is String && v is String) {
          map[k] = v;
        }
      });
    }

    return SavedTeamModel(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      formationName: (json['formationName'] ?? '').toString(),
      playersBySpotId: map,
    );
  }
}

