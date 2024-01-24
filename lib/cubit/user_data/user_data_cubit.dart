import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  void showName() {
    emit(UserNameShow());
  }

  void showTitle() {
    emit(UserTitleShow());
  }
}
