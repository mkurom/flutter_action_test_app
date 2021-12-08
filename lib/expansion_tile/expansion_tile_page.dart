import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  const ExpansionTilePage({Key? key}) : super(key: key);

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  bool _customTileExpanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('called didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
        title: Text(
          'ExpansionTile Page',
        ),
      ),
      body: Column(
        children: <Widget>[
          // 展開時の上下の色をContainerWidgetを使用して分ける
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: ListTile(
                    title: Text('This is tile number 1'),
                  ),
                ),
              ],
            ),
          ),
          //
          Container(
            color: Colors.yellow,
            child: ExpansionTile(
              // 展開時の背景色
              // Containerでラップしても反映される
              backgroundColor: Colors.pink,
              // 閉じているときの背景色
              // 展開時の背景色
              // Containerでラップしても反映される
              collapsedBackgroundColor: Colors.pink[200],
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),

              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: <Widget>[
                Container(
                  color: Colors.pink[100],
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('This is tile number 2'),
                  ),
                ),
              ],
              tilePadding: const EdgeInsets.all(10),
              childrenPadding: const EdgeInsets.all(10),
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // 展開時に上下にDivierが表示される
          ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
          //Themeクラスをラップする事で、展開時に上下にDivierが表示されないようにできる
          // didChangeDependencies関数内で、以下のように設定されている
          // final ThemeData theme = Theme.of(context);
          // _borderColorTween.end = theme.dividerColor;
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text('ExpansionTile 3'),
              subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: Text('This is tile number 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
