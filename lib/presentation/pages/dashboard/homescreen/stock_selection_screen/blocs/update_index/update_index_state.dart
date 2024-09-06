part of 'update_index_bloc.dart';

@immutable
sealed class UpdateIndexState {}

final class UpdateIndexLoadedState extends UpdateIndexState {
  final int? leaderIndex;
  final int? coLeaderIndex;
  final int? viceLeaderIndex;

  UpdateIndexLoadedState({this.leaderIndex, this.coLeaderIndex, this.viceLeaderIndex});
}
