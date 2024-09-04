part of 'stock_selection_bloc.dart';

@immutable
sealed class StockSelectionEvent {}

class AddStockToList extends StockSelectionEvent{
  final List<SelectedStock>? selectedStockList;
  final Map<String,dynamic>? stockList;
  AddStockToList({this.selectedStockList, this.stockList});
}

class AddStockEvent extends StockSelectionEvent{
  final bool? isSelected;
  AddStockEvent(this.isSelected);
}