part of 'tab_bloc.dart';

@immutable
sealed class TabState {}

final class TabInitial extends TabState {
  final int tabIndex;
  TabInitial({required this.tabIndex});
}
