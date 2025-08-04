import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationInitial());
}
