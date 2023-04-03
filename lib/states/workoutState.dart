

import 'package:equatable/equatable.dart';

import '../models/workout.dart';

abstract  class WorkoutSate extends Equatable {
  final Workout? workout;
  final int? elapsed;
  const WorkoutSate(this.workout,this.elapsed);
}
class WorkoutInitial extends WorkoutSate{
  const WorkoutInitial():super(null,0);

  @override
  List<Object?> get props => [];


}
class WorkoutEditing extends WorkoutSate{
  final int index;
  final int? exIndex;


 const WorkoutEditing(Workout? workout,this.index,this.exIndex):super(workout,0);

  @override
  // TODO: implement props
  List<Object?> get props => [workout,index,exIndex];

}

