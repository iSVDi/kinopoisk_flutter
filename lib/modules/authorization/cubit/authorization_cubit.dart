import 'package:bloc/bloc.dart';
import 'package:kinopoisk/services/shared_preferences_service.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationState.login);
  final prefsService = SharedPreferencesServiceImpl();

  Future<bool> signIn(String login, String password) async {
    var saveLoginRes = await prefsService.write(
      login,
      SharedPreferencesKey.login,
    );
    var savePasswordRes = await prefsService.write(
      password,
      SharedPreferencesKey.password,
    );

    return saveLoginRes && savePasswordRes;      
  }
}
