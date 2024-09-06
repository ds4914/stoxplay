part of 'stock_selection_bloc.dart';

@immutable
sealed class StockSelectionState {}

final class StockSelectionInitial extends StockSelectionState {}

class StockSelectionLoadedState extends StockSelectionState {
  final List<int>? upSelectedStock;
  final List<int>? downSelectedStock;
  final List<bool>? moreButtonClicked;
  bool? showSnackBarForMore = false;
  bool? showSnackBarForStockSelection = false;

  StockSelectionLoadedState(
      {this.upSelectedStock,
      this.showSnackBarForMore,
      this.downSelectedStock,
      this.moreButtonClicked,
      this.showSnackBarForStockSelection});
}

// class LeaderClickedState extends StockSelectionState {
//   final int? leaderIndex;
//   LeaderClickedState({required this.leaderIndex});
// }
//
// class CoLeaderClickedState extends StockSelectionState {
//   final int? coLeaderIndex;
//   CoLeaderClickedState({required this.coLeaderIndex});
// }
//
// class ViceLeaderClickedState extends StockSelectionState {
//   final int? viceLeaderIndex;
//   ViceLeaderClickedState({required this.viceLeaderIndex});
// }
