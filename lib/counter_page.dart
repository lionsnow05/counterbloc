import 'package:bloccounterapp/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('-----Hello-----');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Center(
                child: Column(
                  children: [
                    const Text('You have tapped :'),
                    Text('$count times')
                  ],
                ),
              )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().reset(),
            tooltip: 'Reset',
            child: const Icon(Icons.loop),
          ),
        ],
      ),
    );
  }
}
