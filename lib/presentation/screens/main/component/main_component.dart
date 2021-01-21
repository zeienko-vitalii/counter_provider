import 'package:counter_provider/data/net/model/firestore_counter.dart';
import 'package:counter_provider/presentation/common_widgets/common_widgets.dart';
import 'package:counter_provider/presentation/common_widgets/indent.dart';
import 'package:counter_provider/presentation/screens/main/model/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainComponent extends StatefulWidget {
  const MainComponent({Key key}) : super(key: key);

  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  AppBar get _appBar {
    return AppBar(
      title: const Text('Counter'),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<Counter>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Count(),
      floatingActionButton: _floatingButton(),
    );
  }

  Column _floatingButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => context.read<Counter>().increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const Indent(top: 8),
        FloatingActionButton(
          onPressed: () => context.read<Counter>().decrement(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FireStoreCounter counter = context.watch<Counter>().count;
    final bool isError = context.watch<Counter>().isError;
    return isError
        ? error()
        : (counter?.isEmpty ?? true)
            ? loaderWidget()
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('You have pushed the button this many times:'),
                    Text(
                      '${counter.count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
  }
}
