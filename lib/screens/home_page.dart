import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/blocs/workouts_cubits.dart';
import 'package:gymapp/models/workout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Workout Time!"),
        backgroundColor: Colors.blueAccent,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.event_available)
          ),
          IconButton(onPressed: null, icon: Icon(Icons.settings)
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context,workouts) => ExpansionPanelList.radio(
            children: workouts.map((workout) => ExpansionPanelRadio(
                value: workout,
                headerBuilder: (BuildContext context,bool isExpanded ) =>  ListTile(
                  visualDensity: const VisualDensity(
                    horizontal: 0,vertical: VisualDensity.maximumDensity
                  ),
                  leading:  const IconButton(onPressed: null, icon: Icon(Icons.edit)),
                  // String? _title = e.title;
                  title: Text(workout.title!),

                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: workout.exercises.length,
                    itemBuilder: (BuildContext context, int index) =>

                        ListTile(
                          onTap: null,
                          visualDensity: const VisualDensity(
                              horizontal: 0,vertical: VisualDensity.maximumDensity
                          ),
                          leading:  const IconButton(onPressed: null, icon: Icon(Icons.edit)),
                          // String? _title = e.title;

                          title: Text(workout.exercises[index].title!),
                        )

                )
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
