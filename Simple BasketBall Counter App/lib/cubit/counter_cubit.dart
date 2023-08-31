// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CounterState is a parent class for all state classes in order to maintain me accessing all states i need
class CounterCubit extends Cubit<CounterState> {
  // logic for the app to emmit from here the state
  // as   function => (bloc / cubit) => State

  int teamApoints = 0;
  int teamBpoints = 0;

  CounterCubit() : super(CounterAIncrementState());

  void teamIncrement({required String teamType, required int buttonNumber}) {
    if (teamType == 'A') {
      teamApoints += buttonNumber;
      emit(CounterAIncrementState());
    } else {
      teamBpoints += buttonNumber;
      emit(CounterBIncrementState());
    }
  }

  void resetCounterToZero() {
    teamApoints = 0;
    teamBpoints = 0;
    emit(ResetState());
  }
}
