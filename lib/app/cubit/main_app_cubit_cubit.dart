import 'package:kinopoisk/services/shared_preferences_service.dart';


class MainAppCubit {
  final SharedPreferencesService _service = SharedPreferencesServiceImpl();



  Future<bool>? isAuthorized() async {
    var login = await _service.read(SharedPreferencesKey.login);
    var password = await _service.read(SharedPreferencesKey.password);

    return login != null && password != null;
  }
}
