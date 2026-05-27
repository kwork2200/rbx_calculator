import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static final RemoteConfigService _instance =
  RemoteConfigService._internal();

  factory RemoteConfigService() => _instance;

  RemoteConfigService._internal();

  late FirebaseRemoteConfig _remoteConfig;

  Future<void> initialize() async {

    _remoteConfig = FirebaseRemoteConfig.instance;

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 1),
      ),
    );

    await _remoteConfig.setDefaults({
      'app_url': 'https://flutter.dev',
    });

    await _remoteConfig.fetchAndActivate();
  }

  String get appUrl {
    return _remoteConfig.getString('app_url');
  }
}