part of 'calendar_bloc.dart';

abstract class CalendarState  {
  const CalendarState();

}

class CalendarInitial extends CalendarState {}

class UpdateCurrentScreenLoading extends CalendarState {}
class UpdateCurrentTabDone extends CalendarState {}
