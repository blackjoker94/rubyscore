import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sport_choose_state.dart';

class SportChooseCubit extends Cubit<int> {
  SportChooseCubit() : super(0);


  void selectSport(int index) {
    emit(index);
  }
}
