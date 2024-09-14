import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabInitial> {
  TabBloc() : super(TabInitial(tabIndex: 0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(TabInitial(tabIndex: event.tabIndex));
    });
  }
}
