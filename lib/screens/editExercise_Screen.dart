import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/workout_cubit.dart';
import 'package:gymapp/blocs/workouts_cubits.dart';
import 'package:gymapp/models/workout.dart';

class EditExerciseScreen extends StatefulWidget {
  final Workout? workout;
  final int index;
  final int? exIndex;


  const EditExerciseScreen({Key? key,
    this.workout,
    required this.index,
    this.exIndex

}
  ) : super(key: key);

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  TextEditingController? _title;

  @override
  void initState() {
    // TODO: implement initState
    _title = TextEditingController(
      text: widget.workout!.exercises[widget.exIndex!].title
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Expanded(

                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _title,
                  onChanged: (value)=>setState(() {
                    widget.workout!.exercises[widget.exIndex!]
                    =
                    widget.workout!.exercises[widget.exIndex!].copyWith(title: value);

                    BlocProvider.of<WorkoutsCubit>(context).saveWorkout(widget.workout!, widget.index);

                  }),
                )

            )
          ],
        )
      ],
    );
  }
}
