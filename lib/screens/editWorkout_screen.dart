import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/workout_cubit.dart';
import 'package:gymapp/helpers.dart';
import 'package:gymapp/models/exercise.dart';

import '../states/workoutState.dart';
import 'editExercise_Screen.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: BlocBuilder<WorkoutCubit,WorkoutSate>(
        builder:(context,state){
          WorkoutEditing we = state as WorkoutEditing;

          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: (){
                  BlocProvider.of<WorkoutCubit>(context).goHome();
                },
              ),
            ),
            body: ListView.builder(
                itemCount: we.workout!.exercises.length,
                itemBuilder:(context, index){
                Exercise exercise = we.workout!.exercises[index];

                if (we.exIndex == index){
                  // print("edit workout loaded");
                  return EditExerciseScreen(workout:we.workout,index:we.index,exIndex:we.exIndex);


                }else{
                  // print("ok else happended");
                return ListTile(
                  leading: Text(formatTime(exercise.prelude!,true)),
                  title: Text(exercise.title!),
                  trailing: Text(formatTime(exercise.duration!, true)),
                  onTap: (){
                    BlocProvider.of<WorkoutCubit>(context).editExercise(index);
                  },
                );
                }
                }
                ) ,
          );
    }
    ),
        onWillPop: ()=> BlocProvider.of<WorkoutCubit>(context).goHome());
  }
}

