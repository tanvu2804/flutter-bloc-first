import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/count_bloc/count.dart';
import 'package:flutter_bloc_first/navigation/routes/app_routes.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đếm số"),
        centerTitle: true,
      ),
      body: BlocProvider<CountBloc>(
        create: (context) => CountBloc(),
        child: BlocBuilder<CountBloc, CountState>(
          builder: (context, state) {
            final CountBloc countBloc = BlocProvider.of<CountBloc>(context);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.variable}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          countBloc.add(MinusEvent(state.variable));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Center(
                            child: Text("-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          countBloc.add(PlusEvent(state.variable));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Center(
                            child: Text("+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.news);
                    },
                    child: const Text("News"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
