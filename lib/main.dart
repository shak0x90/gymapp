import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/workouts_cubits.dart';
import 'package:gymapp/models/workout.dart';
import 'package:gymapp/screens/home_page.dart';

void main() {
  runApp(const WorkoutTime());
}

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color:Color.fromARGB(255, 66, 74, 96))
        ),
        useMaterial3: true,
      ),
      home: BlocProvider<WorkoutsCubit>(
        create: (BuildContext context){
          WorkoutsCubit workoutsCubit = WorkoutsCubit();
          if(workoutsCubit.state.isEmpty){
            print("json loadind since state is emty");
            workoutsCubit.getWorkouts();
          }else print(".... the state is not emty");
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context,state){
            return const HomePage();
          }
        )
      ),
    );
  }
}

