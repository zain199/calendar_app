part of 'main_layout_bloc.dart';

abstract class MainLayoutEvent  {
  const MainLayoutEvent();

}


class UpdateCurrentScreenEvent extends MainLayoutEvent {
  final int index;

  UpdateCurrentScreenEvent(this.index);
}