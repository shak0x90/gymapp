import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/models/workout.dart';
import 'package:gymapp/states/workoutState.dart';
class WorkoutCubit extends Cubit<WorkoutSate>{
  WorkoutCubit():super(const WorkoutInitial());

  editWorkout(Workout workout,int index)
  => emit(WorkoutEditing(workout, index,null));
  editExercise(int? exIndex) {
    print("....my exercise index is $exIndex");
    emit(WorkoutEditing(state.workout, (state as WorkoutEditing).index, null));
  }


  goHome(){
    emit( const WorkoutInitial());
  }


}
