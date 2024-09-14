part of 'tab_bloc.dart';

@immutable
sealed class TabEvent {}

class ChangeTabEvent extends TabEvent{
  final int tabIndex;
  ChangeTabEvent(this.tabIndex);
}