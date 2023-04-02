import 'package:equatable/equatable.dart';
import 'package:gymapp/models/exercise.dart';

class Workout extends Equatable{
  final String ?title;
  final List<Exercise> exercises;
  const Workout({required this.exercises,required this.title});
  factory Workout.fromJson(Map<String, dynamic > json){
    List<Exercise> exercises=[];
    int index=0;
    int startTime =0;

    for(var ex in(json['exercises'] as Iterable) ){
      exercises.add(Exercise.fromJson(json, index, startTime));
      index++;
      var duration = exercises.last.duration??0;
      print("well this is $index");

      startTime += exercises.last.prelude??0 + duration;
    }
      return Workout(title: json['title'] as String, exercises: exercises);
  }
Map<String,dynamic>toJson()=>{'title':title,'exercises':exercises};

  @override
  // TODO: implement props
  List<Object?> get props => [title,exercises];
  @override
  bool get stringify => true;

}