import 'package:criando_gerenaciamento_estado/builders/observable_builder.dart';
import 'package:criando_gerenaciamento_estado/classes/counter_state.dart';
import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  final counterState = CounterState();
  final observableCounter = StateObservable(0);

  @override
  void initState() {
    observableCounter.addListener(callback);

    super.initState();
  }

  void callback() {
    setState(() {});
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
            ObservableBuilder(
              observable: counterState,
              child: const Text("Child widget"),
              builder: (context, child) {
                return Column(
                  children: [
                    Text(
                        "Valor do estado do ChangeState: ${counterState.counter}"),
                    child!,
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                counterState.increment();
              },
              child: const Text("Incrementar"),
            ),
            Text(
                "Valor do estado do StateObserver: ${observableCounter.state}"),
            ElevatedButton(
              onPressed: () {
                observableCounter.state++;
              },
              child: const Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    observableCounter.removeListener(callback);
    super.dispose();
  }
}
