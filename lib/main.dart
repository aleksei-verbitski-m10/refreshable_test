import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshable_cubit/refreshable_cubit.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Refreshable cubit',
      home: ParentWithRefresher1(),
    ),
  );
}

class ParentWithRefresher1 extends StatelessWidget {
  const ParentWithRefresher1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshableCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('ParentWithRefresher1'),
            ),
            body: Center(
              child: Column(
                children: [
                  BlocBuilder<RefreshableCubit, RefreshableState>(
                    builder: (_, state) => Text(state.counter.toString()),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RefreshableCubit>().increaseCounter();
                    },
                    child: const Text('Increase counter'),
                  ),
                  ElevatedButton(
                    child: const Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParentWithRefresher2(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class ParentWithRefresher2 extends StatelessWidget {
  const ParentWithRefresher2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshableCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('ParentWithRefresher2'),
            ),
            body: Center(
              child: Column(
                children: [
                  BlocBuilder<RefreshableCubit, RefreshableState>(
                    builder: (_, state) => Text(state.counter.toString()),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RefreshableCubit>().increaseCounter();
                    },
                    child: const Text('Increase counter'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go back!'),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
