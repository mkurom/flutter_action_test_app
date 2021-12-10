import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  _CustomScrollViewPageState createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  // static const dataPagerHeight = 70.0;
  bool showLoadingIndicator = false;
  @override
  void initState() {
    super.initState();
  }

  void rebuildList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomScrollView sample'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: 30 * (index % 9),
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('SliverList $index'),
                  );
                },
                childCount: 10,
              ),
            ),
            // 子Widgetの高さが固定（itemExtentで指定）なら、SliverFixedExtentListを使用した方が良い
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    // ↓itemExtentが優先される
                    // height: 30,
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('SliverFixedExtentList $index'),
                  );
                },
                childCount: 10,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('SliverGrid $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(child: Text('SliverPadding')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
