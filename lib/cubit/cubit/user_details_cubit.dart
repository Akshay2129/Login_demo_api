// user_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:login_demo_api/api_services/user_api_services.dart';
import 'package:login_demo_api/models/users_details.dart';
import 'package:meta/meta.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());

  Future<void> getDetails() async {
    emit(UserDetailsLoading());
    try {
      final value = await GetApiServices.getDetails();
      emit(UserDetailsLoaded(value!));
    } catch (error) {
      print(error.toString());
      emit(UserDetailsError(error.toString()));
    }
  }
}
