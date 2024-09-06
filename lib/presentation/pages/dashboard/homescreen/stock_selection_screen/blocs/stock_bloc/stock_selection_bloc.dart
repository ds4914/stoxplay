import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../shared/utils/snackbar.dart';

part 'stock_selection_event.dart';
part 'stock_selection_state.dart';

class StockSelectionBloc extends Bloc<StockSelectionEvent, StockSelectionState> {
  StockSelectionBloc() : super(StockSelectionLoadedState(downSelectedStock: [], moreButtonClicked: [], upSelectedStock: [])) {
    ///when user clicks the up or down button to select the stock then this event is called.
    on<StockSelectionAddEvent>((event, emit) {
      if (event.upSelectedStock!.length + event.downSelectedStock!.length < 11) {
        if (event.isUp!) {
          if (event.downSelectedStock!.contains(event.index)) {
            event.downSelectedStock!.remove(event.index);
          }
          if (!event.upSelectedStock!.contains(event.index)) {
            event.upSelectedStock!.add(event.index!);
          }
        } else {
          if (event.upSelectedStock!.contains(event.index)) {
            event.upSelectedStock!.remove(event.index);
          }
          if (!event.downSelectedStock!.contains(event.index)) {
            event.downSelectedStock!.add(event.index!);
          }
        }
        if(event.upSelectedStock!.length + event.downSelectedStock!.length == 10){
          event.showSnackBar = true;
        }
      } else {
        event.showSnackBar = true;
      }
      emit(StockSelectionLoadedState(
          downSelectedStock: event.downSelectedStock,
          moreButtonClicked: event.moreButtonClicked,
          upSelectedStock: event.upSelectedStock,
          showSnackBarForStockSelection: event.showSnackBar));
    });

    /// when user clicks on card to remove the stock from the list
    on<StockSelectionRemoveEvent>((event, emit) {
      if (event.downSelectedStock!.contains(event.index)) {
        event.downSelectedStock!.remove(event.index);
      }
      if (event.upSelectedStock!.contains(event.index)) {
        event.upSelectedStock!.remove(event.index);
      }
      if (event.moreButtonClicked![event.index!] == true) {
        event.moreButtonClicked![event.index!] = false;
      }
      emit(StockSelectionLoadedState(
          downSelectedStock: event.downSelectedStock,
          moreButtonClicked: event.moreButtonClicked,
          upSelectedStock: event.upSelectedStock));
    });

    ///when user clicks on the more button which is between the up and down button to select the role of the stock
    on<OnMoreClickedEvent>((event, emit) {
      if (event.downSelectedStock!.contains(event.index) || event.upSelectedStock!.contains(event.index)) {
        event.moreButtonClicked![event.index!] = !event.moreButtonClicked![event.index!];
      } else {
        event.showSnackBar = true;
      }
      emit(StockSelectionLoadedState(
          downSelectedStock: event.downSelectedStock!,
          moreButtonClicked: event.moreButtonClicked,
          showSnackBarForMore: event.showSnackBar,
          upSelectedStock: event.upSelectedStock));
    });

    ///when user click on leader role
    // on<OnLeaderClickedEvent>((event, emit) {
    //   if (event.viceLeaderIndex != event.index && event.coLeaderIndex != event.index) {
    //     event.leaderIndex = event.index;
    //   }
    //   emit(LeaderClickedState(leaderIndex: event.leaderIndex),);
    // });

    ///when user click on co leader role
    // on<OnCoLeaderClickedEvent>((event, emit) {
    //   if (event.viceLeaderIndex != event.index && event.leaderIndex != event.index) {
    //     event.coLeaderIndex = event.index;
    //   }
    //   emit(CoLeaderClickedState(coLeaderIndex: event.coLeaderIndex));
    // });

    ///when user click on vice leader role
    // on<OnViceLeaderClickedEvent>((event, emit) {
    //   if (event.leaderIndex != event.index && event.coLeaderIndex != event.index) {
    //     event.viceLeaderIndex = event.index;
    //   }
    //   emit(ViceLeaderClickedState(viceLeaderIndex: event.viceLeaderIndex));
    // });
  }
}
