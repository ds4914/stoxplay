part of 'update_index_bloc.dart';

@immutable
sealed class UpdateIndexEvent {}

class UpdateIndexClickedEvent extends UpdateIndexEvent {
  int? leaderIndex;
  int? coLeaderIndex;
  int? viceLeaderIndex;
  final int? index;
  final bool? updateLeader;
  final bool? updateCoLeader;
  final bool? updateViceLeader;
  UpdateIndexClickedEvent(
      {this.index,
      this.leaderIndex,
      this.updateViceLeader,
      this.coLeaderIndex,
      this.viceLeaderIndex,
      this.updateCoLeader,
      this.updateLeader});
}
