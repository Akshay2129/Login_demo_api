import 'package:bloc/bloc.dart';
import 'package:login_demo_api/cubit/cubit/user_login_state.dart';
import 'package:login_demo_api/models/login_model.dart';
import 'package:login_demo_api/api_services/api_services.dart';
import 'package:meta/meta.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

  void userLogin(String email, String password) {
    emit(UserLoginLoading());
    ApiServices().userLogIn(email, password).then((value) {
      if (value != null) {
        emit(UserLoginLoaded(value));
        print("Token: ${value.token}");
      } else {
        emit(UserLoginError());
      }
    }).catchError((error) {
      emit(UserLoginError());
      print(error.toString());
    });
  }
}
