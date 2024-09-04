part of 'stock_selection_bloc.dart';

@immutable
sealed class StockSelectionState {}

final class StockSelectionInitial extends StockSelectionState {}

final class StockSelectionListState extends StockSelectionState {
  final List<SelectedStock>? selectedStockList;
  final Map<String,dynamic>? stockList;
  StockSelectionListState({this.selectedStockList, this.stockList});
}

final class StockSelectedState extends StockSelectionState {
  final bool? isSelected;
  StockSelectedState(this.isSelected);
}

