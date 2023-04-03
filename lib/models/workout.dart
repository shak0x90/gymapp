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
      exercises.add(Exercise.fromJson(ex, index, startTime));
      index++;
      int prelude = exercises.last.prelude!;
      // print(exercises.last.prelude);
      // print(exercises.last.duration);
       int duration = exercises.last.duration!;
      print("well this is $index");

      startTime += prelude + duration;
      print(startTime);
    }
      return Workout(title: json['title'] as String?, exercises: exercises);
  }
Map<String,dynamic>toJson()=>{'title':title,'exercises':exercises};
  int getTotalTime(){
    int time = exercises.fold(0, (previousValue, ex) => previousValue + ex.duration! + ex.prelude!);
    return time;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title,exercises];
  @override
  bool get stringify => true;

}