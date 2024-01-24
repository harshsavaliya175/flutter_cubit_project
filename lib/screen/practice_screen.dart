import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_project/cubit/practice/practice_cubit.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PracticeCubit practiceCubit = BlocProvider.of<PracticeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PracticeCubit, PracticeState>(
                builder: (BuildContext context, PracticeState state) {
                  print('GreenAccent BlocBuilder');
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: state.greenAccentHeight,
                    width: state.greenAccentWidth,
                    color: Colors.greenAccent,
                  );
                },
                buildWhen: (previous, current) {
                  return previous.greenAccentHeight !=
                          current.greenAccentHeight ||
                      previous.greenAccentWidth != current.greenAccentWidth;
                },
              ),
              const SizedBox(width: 10),
              BlocBuilder<PracticeCubit, PracticeState>(
                builder: (BuildContext context, PracticeState state) {
                  print('Black BlocBuilder');
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: state.blackHeight,
                    width: state.blackWidth,
                    color: Colors.black,
                  );
                },
                buildWhen: (previous, current) {
                  return previous.blackHeight != current.blackHeight ||
                      previous.blackWidth != current.blackWidth;
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PracticeCubit, PracticeState>(
                builder: (BuildContext context, PracticeState state) {
                  print('Red BlocBuilder');
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: state.redHeight,
                    width: state.redWidth,
                    color: Colors.red,
                  );
                },
                buildWhen: (previous, current) {
                  return previous.redHeight != current.redHeight ||
                      previous.redWidth != current.redWidth;
                },
              ),
              const SizedBox(width: 10),
              BlocBuilder<PracticeCubit, PracticeState>(
                builder: (BuildContext context, PracticeState state) {
                  print('Yellow BlocBuilder');
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: state.yellowHeight,
                    width: state.yellowWidth,
                    color: Colors.amber,
                  );
                },
                buildWhen: (previous, current) {
                  return previous.yellowHeight != current.yellowHeight ||
                      previous.yellowWidth != current.yellowWidth;
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2, color: Colors.black),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  practiceCubit.changeGreenAccentContainer();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.greenAccent,
                  ),
                ),
                child: const Text(
                  'greenAccent',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  practiceCubit.changeBlackContainer();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.black,
                  ),
                ),
                child: const Text('black'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  practiceCubit.changeRedContainer();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.red,
                  ),
                ),
                child: const Text(
                  'red',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  practiceCubit.changeYellowContainer();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.yellow,
                  ),
                ),
                child: const Text(
                  'yellow',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
