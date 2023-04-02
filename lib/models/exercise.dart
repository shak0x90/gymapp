import 'package:equatable/equatable.dart';

class Exercise extends Equatable{
  Exercise({
    required this.title,
    required this.prelude,
    required this.duration,
    this.startTime,
    this.index


  });

  final String? title;
  final int? prelude;
  final int? duration;
  final int? startTime;
  final int? index;

  factory Exercise.fromJson(Map<String, dynamic> json,int startTime,int index) => Exercise(
    title: json["title"],
      prelude: json["prelude"],
    duration: json["duration"],
    startTime: startTime,
    index: index

  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "prelude": prelude,
    "duration": duration,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [title,prelude,duration,startTime,index];

  @override
  bool get stringify => true;
}