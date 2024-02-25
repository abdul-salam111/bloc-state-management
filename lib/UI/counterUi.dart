import 'package:blocstate_mgt/bloc/counter_bloc/counter_bloc.dart';
import 'package:blocstate_mgt/bloc/counter_bloc/counter_event.dart';
import 'package:blocstate_mgt/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key, required this.title});
  final String title;

  @override
  State<CounterView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncreamentCounter());
            },
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecreamentCounter());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
