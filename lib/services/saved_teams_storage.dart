import 'package:get_storage/get_storage.dart';

import '../models/saved_team_model.dart';

class SavedTeamsStorage {
  static const String _key = 'saved_teams';

  final GetStorage _box = GetStorage();

  List<SavedTeamModel> readTeams() {
    final raw = _box.read(_key);
    if (raw is! List) return const [];

    return raw
        .whereType<Map>()
        .map((m) => SavedTeamModel.fromJson(Map<String, dynamic>.from(m)))
        .toList(growable: false);
  }

  Future<void> writeTeams(List<SavedTeamModel> teams) async {
    await _box.write(_key, teams.map((t) => t.toJson()).toList(growable: false));
  }
}

