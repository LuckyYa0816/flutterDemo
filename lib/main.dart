import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter4/constraints.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //platform: TargetPlatform.android,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _generateItem(BuildContext context, List<page> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => page.openPage(context),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter实战'),
        ),
        body: ListView(
          children: <Widget>[
            ExpansionTile(
              title: const Text("布局类组件"),
              children: _generateItem(context,[
                page(
                  "约束",
                  const SizeConstraintsRoute(),
                ),
              ])
            ),
          ],
        ));
  }
}

class page {
  String title;
  WidgetBuilder builder;

  page(this.title,Widget child): builder = ((_) => child);

  page.builder(
    this.title,
    this.builder
  );

  Future<T?> openPage<T>(BuildContext context) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: builder)
    );
  }
}
