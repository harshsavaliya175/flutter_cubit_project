import 'package:flutter_bloc/flutter_bloc.dart';

part 'practice_state.dart';

class PracticeCubit extends Cubit<PracticeState> {
  PracticeCubit() : super(PracticeState());

  void changeGreenAccentContainer() {
    emit(PracticeState(greenAccentHeight: 60, greenAccentWidth: 70));
  }

  void changeBlackContainer() {
    emit(PracticeState(blackHeight: 200, blackWidth: 50));
  }

  void changeRedContainer() {
    emit(PracticeState(redHeight: 60, redWidth: 40));
  }

  void changeYellowContainer() {
    emit(PracticeState(yellowHeight: 90, yellowWidth: 90));
  }
}
