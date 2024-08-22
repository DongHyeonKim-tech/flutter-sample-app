import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _selectedValue = 'One';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final TextEditingController _controller = TextEditingController();
  final List<TextEditingController> _tableController = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("Input value: ${_controller.text}");
    });
    for (int i = 0; i < 4; i++) {
      _tableController.add(TextEditingController());
      _tableController[i].addListener(() {
        print("Value in cell ${i + 1}: ${_tableController[i].text}");
      });
    }
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
              'You have pushed the button this many times!!!!:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('test 2'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter something"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'name'),
              onChanged: (e) {
                print(e);
              },
            ),
            DropdownButton<String>(
              value: _selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              items: <String>['One', 'Two','Three', 'Four'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("${value} label"),
                );
              }).toList(),
            ),
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(children: [
                  TableCell(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Column 1'),
                  )),
                  TableCell(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Column 2'),
                  ))
                ]),
                TableRow(children: [
                  TableCell(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tableController[0],
                      decoration: InputDecoration(labelText: "Input 1"),
                    ),
                  )),
                  TableCell(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tableController[1],
                      decoration: InputDecoration(labelText: "Input 2"),
                    ),
                  )),
                ]),
                TableRow(children: [
                  TableCell(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tableController[2],
                      decoration: InputDecoration(labelText: "Input 3"),
                    ),
                  )),
                  TableCell(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _tableController[3],
                      decoration: InputDecoration(labelText: "Input 4"),
                    ),
                  )),
                ]),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
