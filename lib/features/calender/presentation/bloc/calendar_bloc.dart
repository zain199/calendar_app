
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  

  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarEvent>(
      (event, emit) async {
        if(event is UpdateCurrentTabEvent)
          {
            updateCurrentTab(event , emit);
          }
      },
    );
  }

 int tabIndex = 0 ;
  void updateCurrentTab(UpdateCurrentTabEvent event, Emitter<CalendarState> emit){
    tabIndex = event.index;
    emit(UpdateCurrentTabDone());
  }

}
