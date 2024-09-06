part of 'stock_selection_bloc.dart';

@immutable
sealed class StockSelectionEvent {}

class StockSelectionAddEvent extends StockSelectionEvent {
  final int? index;
  final bool? isUp;
  final List<int>? upSelectedStock;
  final List<int>? downSelectedStock;
  final List<bool>? moreButtonClicked;
  bool? showSnackBar = false;

  StockSelectionAddEvent(
      {this.upSelectedStock, this.downSelectedStock, this.moreButtonClicked, this.index, this.isUp, this.showSnackBar});
}

class StockSelectionRemoveEvent extends StockSelectionEvent {
  final int? index;
  final List<int>? upSelectedStock;
  final List<int>? downSelectedStock;
  final List<bool>? moreButtonClicked;
  StockSelectionRemoveEvent({this.upSelectedStock, this.downSelectedStock, this.moreButtonClicked, this.index});
}

class OnMoreClickedEvent extends StockSelectionEvent {
  final int? index;
  final List<int>? upSelectedStock;
  final List<int>? downSelectedStock;
  final List<bool>? moreButtonClicked;
  bool? showSnackBar = false;
  OnMoreClickedEvent({this.upSelectedStock, this.showSnackBar, this.downSelectedStock, this.moreButtonClicked, this.index});
}
//
// class OnLeaderClickedEvent extends StockSelectionEvent {
//   int? leaderIndex;
//   final int? coLeaderIndex;
//   final int? viceLeaderIndex;
//   final int? index;
//
//   OnLeaderClickedEvent({this.index, this.leaderIndex, this.coLeaderIndex, this.viceLeaderIndex});
// }
//
// class OnCoLeaderClickedEvent extends StockSelectionEvent {
//   final int? leaderIndex;
//   int? coLeaderIndex;
//   final int? viceLeaderIndex;
//   final int? index;
//
//   OnCoLeaderClickedEvent({this.index, this.leaderIndex, this.coLeaderIndex, this.viceLeaderIndex});
// }
//
// class OnViceLeaderClickedEvent extends StockSelectionEvent {
//   final int? leaderIndex;
//   final int? coLeaderIndex;
//   int? viceLeaderIndex;
//   final int? index;
//
//   OnViceLeaderClickedEvent({this.index, this.leaderIndex, this.coLeaderIndex, this.viceLeaderIndex});
// }
