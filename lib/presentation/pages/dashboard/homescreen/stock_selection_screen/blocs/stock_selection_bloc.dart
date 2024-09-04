import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stock_selection_event.dart';
part 'stock_selection_state.dart';

class StockSelectionBloc
    extends Bloc<StockSelectionEvent, StockSelectionState> {
  StockSelectionBloc() : super(StockSelectionInitial()) {
    on<AddStockToList>((event, emit) {
      emit(StockSelectionListState(selectedStockList:event.selectedStockList,stockList: event.stockList));
    });
    on<AddStockEvent>((event, emit) {
      emit(StockSelectedState(event.isSelected));
    });
  }
}

class SelectedStock {
  final int? stockId;
  final String? stockName;
  final bool? isUp;
  SelectedStock(
      {required this.stockId, required this.isUp, required this.stockName});
}
