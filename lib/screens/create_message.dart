import 'package:flutter/material.dart';

class CreateMessage extends StatefulWidget {
  const CreateMessage({super.key});

  // final String title;

  @override
  State<CreateMessage> createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text("AutoGraph"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView.separated(
        itemBuilder: (ctx, index) {
          return const ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            // ignore: prefer_interpolation_to_compose_strings
            title: Text('ContactName'),
            subtitle: Text('MessageTitle'),
            trailing: Text('Time'),
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
        itemCount: _counter,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'New Message',
        child: const Icon(Icons.chat),
      ),
    );
  }
}
