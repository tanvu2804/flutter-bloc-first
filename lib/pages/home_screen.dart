import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/time_bloc/time.dart';
import 'package:flutter_bloc_first/navigation/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đồng hồ bấm giờ"),
        centerTitle: true,
      ),
      body: BlocProvider<TimeBloc>(
        create: (context) => TimeBloc(),
        child: BlocBuilder<TimeBloc, TimeState>(
          builder: (context, state) {
            final String minuteStr = ((state.timeDuration / 60) % 60)
                .floor()
                .toString()
                .padLeft(2, '0');
            final String secondStr =
                (state.timeDuration % 60).floor().toString().padLeft(2, '0');
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$minuteStr:$secondStr',
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: button(context, state),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.count);
                      },
                      child: const Text("Đếm số"),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }

  button(context, state) {
    final TimeBloc timeBloc = BlocProvider.of<TimeBloc>(context);
    if (state is InitialState) {
      return [
        FloatingActionButton(
          onPressed: () => timeBloc.add(StartEvent(state.timeDuration)),
          child: const Icon(Icons.play_arrow),
        )
      ];
    } else if (state is RunningState) {
      return [
        FloatingActionButton(
          onPressed: () => timeBloc.add(PauseEvent()),
          child: const Icon(Icons.pause),
        ),
        FloatingActionButton(
          onPressed: () => timeBloc.add(ResetEvent()),
          child: const Icon(Icons.replay),
        )
      ];
    } else if (state is PauseState) {
      return [
        FloatingActionButton(
          onPressed: () => timeBloc.add(ResumeEvent()),
          child: const Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () => timeBloc.add(ResetEvent()),
          child: const Icon(Icons.replay),
        )
      ];
    } else if (state is CompletedState) {
      return [
        FloatingActionButton(
          onPressed: () => timeBloc.add(ResetEvent()),
          child: const Icon(Icons.replay),
        )
      ];
    }
    return [];
  }
}
