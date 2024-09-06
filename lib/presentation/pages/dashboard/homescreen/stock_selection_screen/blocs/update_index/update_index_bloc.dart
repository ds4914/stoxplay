import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_index_event.dart';
part 'update_index_state.dart';

class UpdateIndexBloc extends Bloc<UpdateIndexEvent, UpdateIndexState> {
  UpdateIndexBloc() : super(UpdateIndexLoadedState()) {
    on<UpdateIndexClickedEvent>((event, emit) {
      if (event.viceLeaderIndex != event.index && event.coLeaderIndex != event.index && event.updateLeader == true) {
        event.leaderIndex = event.index;
      } else if (event.viceLeaderIndex != event.index && event.leaderIndex != event.index && event.updateCoLeader == true) {
        event.coLeaderIndex = event.index;
      } else if (event.leaderIndex != event.index && event.coLeaderIndex != event.index && event.updateViceLeader == true) {
        event.viceLeaderIndex = event.index;
      }
      emit(UpdateIndexLoadedState(
          viceLeaderIndex: event.viceLeaderIndex, coLeaderIndex: event.coLeaderIndex, leaderIndex: event.leaderIndex));
    });
  }
}
