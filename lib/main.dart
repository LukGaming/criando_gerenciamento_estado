import 'package:criando_gerenaciamento_estado/classes/counter_state.dart';
import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
import 'package:criando_gerenaciamento_estado/extensions/state_observable_extensions.dart';
import 'package:criando_gerenaciamento_estado/mixins/change_state_mixin.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ChangeStateMixin {
  final counterState = CounterState();
  final observableCounter = StateObservable(0);
  late StateObservable<int> newMixinCounter;

  @override
  void initState() {
    useChangeState(counterState);
    useChangeState(observableCounter);
    newMixinCounter = useStateObservable(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de estado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor do counterState: ${counterState.counter}"),
            ElevatedButton(
              onPressed: () {
                counterState.increment();
              },
              child: const Text("Increment"),
            ),
            Text("Valor do observableCounter: ${observableCounter.state}"),
            ElevatedButton(
              onPressed: () {
                observableCounter.state++;
              },
              child: const Text("Increment"),
            ),
            Text("Valor do newMixinStateObservable: ${newMixinCounter.state}"),
            ElevatedButton(
              onPressed: () {
                newMixinCounter.state++;
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
