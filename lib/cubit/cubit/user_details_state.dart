// user_details_state.dart
part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {
  get userDetailsModel => null;
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetailsModel userDetailsModel;
  UserDetailsLoaded(this.userDetailsModel);
}

class UserDetailsError extends UserDetailsState {
  final String errorMessage;
  UserDetailsError(this.errorMessage);
}
