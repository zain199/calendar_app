part of 'main_layout_bloc.dart';

abstract class MainLayoutState  {
  const MainLayoutState();

}

class MainLayoutInitial extends MainLayoutState {}

class UpdateCurrentScreenLoading extends MainLayoutState {}
class UpdateCurrentScreenDone extends MainLayoutState {}
