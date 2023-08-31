import 'package:basketball_points_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_points_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
      // builder used to change the whole ui page to another state like showing loadin indicator
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Points Counter',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 26, 49, 68),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Team A',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${BlocProvider.of<CounterCubit>(context).teamApoints}',
                        style: const TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 26, 49, 68),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(buttonNumber: 1, teamType: 'A');
                          },
                          child: const Text(
                            'Add 1 Point',
                            style: TextStyle(color: Colors.white),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(buttonNumber: 2, teamType: 'A');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 26, 49, 68),
                          //backgroundColor: Color.fromARGB(255, 26, 49, 68),
                        ),
                        child: const Text(
                          'Add 2 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 26, 49, 68),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(buttonNumber: 3, teamType: 'A');
                        },
                        child: const Text(
                          'Add 3 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const VerticalDivider(
                    color: Colors.grey, // Set the color of the divider
                    thickness: 1, // Set the thickness of the divider
                    width: 10, // Set the width of the divider
                    indent: 4,
                    endIndent: 4,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${BlocProvider.of<CounterCubit>(context).teamBpoints}',
                        style: const TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 26, 49, 68),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(buttonNumber: 1, teamType: 'B');
                          },
                          child: const Text(
                            'Add 1 Point',
                            style: TextStyle(color: Colors.white),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(buttonNumber: 2, teamType: 'B');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 26, 49, 68),
                          //backgroundColor: Color.fromARGB(255, 26, 49, 68),
                        ),
                        child: const Text(
                          'Add 2 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 26, 49, 68),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .teamIncrement(buttonNumber: 3, teamType: 'B');
                        },
                        child: const Text(
                          'Add 3 Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(130.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 26, 49, 68),
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).resetCounterToZero();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      );
    }, listener: (context, state) {
      // rebuild the screen after recieving specifec state
      //  we use it when we want to make a specific change in the screen not the whole page
      if (state is CounterAIncrementState) {
        // we use this line to access variables / functions from cubit in ui and make bloc not lazy
        BlocProvider.of<CounterCubit>(context).teamApoints;
      } else if (state is CounterBIncrementState) {
        BlocProvider.of<CounterCubit>(context).teamBpoints;
      } else // reset state
      {}
    });
  }
}
