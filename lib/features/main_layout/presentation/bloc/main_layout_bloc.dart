
import 'package:bloc/bloc.dart';
part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  

  MainLayoutBloc() : super(MainLayoutInitial()) {
    on<MainLayoutEvent>(
      (event, emit) async {
        if(event is UpdateCurrentScreenEvent)
          {
            updateCurrentScreen(event , emit);
          }
      },
    );
  }

 int screenIndex = 0 ;
  void updateCurrentScreen(UpdateCurrentScreenEvent event, Emitter<MainLayoutState> emit){
    screenIndex = event.index;
    emit(UpdateCurrentScreenDone());
  }

}
