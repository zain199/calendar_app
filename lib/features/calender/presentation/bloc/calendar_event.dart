part of 'calendar_bloc.dart';

abstract class CalendarEvent  {
  const CalendarEvent();

}


class UpdateCurrentTabEvent extends CalendarEvent {
  final int index;

  UpdateCurrentTabEvent(this.index);
}