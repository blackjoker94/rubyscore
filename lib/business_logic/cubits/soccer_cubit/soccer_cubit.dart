import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubyscore/data/model/football.dart';
import 'package:rubyscore/data/repos/football_repo.dart';

part 'soccer_state.dart';

class SoccerCubit extends Cubit<SoccerState> {
  SoccerCubit(this.footballRepo) : super(SoccerInitial());

  FootballRepo footballRepo;
  List<Football>? football;

  void getAllLiveMatches() async {
    emit(SoccerLoading());
    try {
      football=await footballRepo.getAllLiveMatches();
      emit(SoccerSuccess());
    } catch (e) {
      emit(SoccerFailed());
    }
  }
  
    

}
