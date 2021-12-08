import 'package:flutter/material.dart';
import 'package:flutter_action_test_app/pagenation_list_view/page_model.dart';
import 'package:flutter_action_test_app/pagenation_list_view/pagenation_view_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataPagerWithListView extends StatefulWidget {
  @override
  _DataPagerWithListView createState() => _DataPagerWithListView();
}

List<PagingProduct> _paginatedProductData = [];

List<PagingProduct> _products = [];
int rowsPerPage = 10;

class _DataPagerWithListView extends State<DataPagerWithListView> {
  // static const dataPagerHeight = 70.0;
  bool showLoadingIndicator = false;
  @override
  void initState() {
    super.initState();

    // view_modelからデータを取得
    _products = List.from(populateData());
    // ページカウント = データ数 / 1ページの表示数
  }

  void rebuildList() {
    setState(() {});
  }

  Widget loadListView(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];

      if (_products.isNotEmpty) {
        stackChildren.add(
          ListView.custom(
            childrenDelegate: CustomSliverChildBuilderDelegate(indexBuilder),
          ),
        );
      }

      if (showLoadingIndicator) {
        stackChildren.add(
          Container(
            color: Colors.black12,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          ),
        );
      }
      return stackChildren;
    }

    return Stack(
      children: _getChildren(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('print');
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('pagenation sample'),
          ),
          // body: _layout(),
          body: Column(
            children: [
              _pagenationBottombar(),
            ],
          ),
        ),
      ),
    );
  }

  // 選択しているページ
  int _selectedIndex = 0;
  // アイテム数 / 10 (1ページの表示数)
  int _maxPage = 0;
  // 検索して見つかったアイテム数
  int _itemCount = 0;
  // ボタンサイズ
  double _buttonSize = 26;

  Widget _pagenationButton(Color color, Function function, Widget widget) {
    return Container(
      height: _buttonSize,
      width: _buttonSize,
      color: color,
      margin: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          setState(
            () {
              function();
            },
          );
        },
        child: Center(child: widget),
      ),
    );
  }

  Widget _pagenationBottombar() {
    final screenWidth = MediaQuery.of(context).size.width;
    // サンプル数
    _itemCount = 100;
    // ページの最大数
    _maxPage = ((_itemCount / 10) == 0 ? 1 : (_itemCount / 10)).ceil();

    //現在のページから前後1ページを表示する
    final beforecurrentPageCount = 1;
    final startPageToEndPageCount = beforecurrentPageCount * 2 + 1;

    final startpage =
        1 < _selectedIndex ? _selectedIndex - beforecurrentPageCount : 0;
    final endpage = startpage + startPageToEndPageCount < _maxPage
        ? startpage + startPageToEndPageCount
        : _maxPage;

    List<Widget> _widget = [];

    // 先頭の矢印
    if (_selectedIndex != 0 && _maxPage > 1) {
      _widget.add(
        _pagenationButton(
          Colors.blue,
          () {
            _selectedIndex--;
          },
          Icon(Icons.arrow_back_ios_new_outlined),
        ),
      );
    }

    // 1と「・・・」
    if (_selectedIndex > 0) {
      if (startpage > 0) {
        _widget.add(
          _pagenationButton(
            Colors.amber,
            () {
              _selectedIndex = 0;
            },
            Text(
              1.toString(),
            ),
          ),
        );
      }
      if (_selectedIndex > 2) {
        _widget.add(
          _pagenationButton(
            Colors.white,
            () {},
            Icon(Icons.keyboard_control_outlined),
          ),
        );
      }
    }

    for (var i = startpage; i < endpage; i++) {
      _widget.add(
        _pagenationButton(
          (i == _selectedIndex) ? Colors.green : Colors.amber,
          () {
            _selectedIndex = i;
          },
          Text(
            (i + 1).toString(),
          ),
        ),
      );
    }

    // _maxPageと「・・・」
    if (_maxPage - 1 > _selectedIndex) {
      if (_maxPage - 4 > _selectedIndex) {
        _widget.add(
          _pagenationButton(
            Colors.white,
            () {},
            Icon(Icons.keyboard_control_outlined),
          ),
        );
      }

      if (_maxPage > endpage) {
        _widget.add(
          _pagenationButton(
            Colors.amber,
            () {
              _selectedIndex = _maxPage - 1;
            },
            Text(
              (_maxPage).toString(),
            ),
          ),
        );
      }
    }

    // 末尾の矢印
    if (_selectedIndex != _maxPage - 1 && _maxPage > 1) {
      _widget.add(
        _pagenationButton(
          Colors.blue,
          () {
            _selectedIndex++;
          },
          Icon(Icons.arrow_forward_ios_outlined),
        ),
      );
    }

    return Column(
      children: [
        Text('ページ数：$_maxPage'),
        Text('アイテム数：$_itemCount'),
        Text('選択：${_selectedIndex}'),
        Text('$startpage - $endpage'),
        Container(
          height: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _widget,
        ),
      ],
    );
  }

  Widget indexBuilder(BuildContext context, int index) {
    final PagingProduct data = _paginatedProductData[index];
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
              width: constraint.maxWidth,
              height: 100,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraint.maxWidth - 130,
                          child: Text(data.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                  fontSize: 15)),
                        ),
                        // Container(
                        //   width: constraint.maxWidth - 130,
                        //   child: Text(data.weight!,
                        //       style: TextStyle(
                        //           color: Colors.black87, fontSize: 10)),
                        // ),
                        Container(
                          width: constraint.maxWidth - 130,
                          child: Row(
                            children: [
                              Container(
                                color: Colors.green.shade900,
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    // Text('${data.reviewValue}',
                                    //     textAlign: TextAlign.end,
                                    //     style: TextStyle(
                                    //         color: Colors.white, fontSize: 13),
                                    // ),
                                    SizedBox(width: 2),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              // Text(
                              //   '${data.ratings}',
                              //   textAlign: TextAlign.end,
                              //   style: TextStyle(
                              //       color: Colors.black87, fontSize: 11),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          width: constraint.maxWidth - 130,
                          child: Row(
                            children: [
                              // Container(
                              //   child: Text('\$${data.price}',
                              //       style: TextStyle(
                              //           color: Colors.green.shade800,
                              //           fontSize: 13)),
                              // ),
                              SizedBox(width: 8),
                              // Text(
                              //   '${data.offer}',
                              //   style: TextStyle(
                              //       color: Colors.black87, fontSize: 10),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class CustomSliverChildBuilderDelegate extends SliverChildBuilderDelegate
    with DataPagerDelegate, ChangeNotifier {
  CustomSliverChildBuilderDelegate(builder) : super(builder);

  @override
  int get childCount => _paginatedProductData.length;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startRowIndex = newPageIndex * rowsPerPage;
    int endRowIndex = startRowIndex + rowsPerPage;

    if (endRowIndex > _products.length) {
      endRowIndex = _products.length - 1;
    }

    await Future.delayed(Duration(milliseconds: 2000));
    _paginatedProductData =
        _products.getRange(startRowIndex, endRowIndex).toList(growable: false);
    notifyListeners();
    return true;
  }

  @override
  bool shouldRebuild(covariant CustomSliverChildBuilderDelegate oldDelegate) {
    return true;
  }
}
