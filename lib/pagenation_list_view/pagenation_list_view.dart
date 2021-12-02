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
  static const double dataPagerHeight = 70.0;
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
    print('print');
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
  int _pageCount = 0;
  // 検索して見つかったアイテム数
  int _itemCount = 0;

// List<int> _list = List.generate(5, (index) => index * 2);

  Widget _pagenationBottombar() {
    final screenWidth = MediaQuery.of(context).size.width;
    // サンプル数
    _itemCount = 40;
    _pageCount = ((_itemCount / 10) == 0 ? 1 : (_itemCount / 10)).ceil();

    return Column(
      children: [
        Text('ページ数：$_pageCount'),
        Text('アイテム数：$_itemCount'),
        Text('選択：${_selectedIndex + 1}'),
        Container(
          width: screenWidth,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // alignment: Alignment.center,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              // 先頭の矢印
              if (_selectedIndex != 0 && _pageCount > 1)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        height: 45,
                        width: 45,
                        color: Colors.blue,
                        margin: const EdgeInsets.all(2),
                        child: InkWell(
                          onTap: () {
                            print(index);

                            setState(() {
                              _selectedIndex--;
                            });
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              // ボタン
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (_pageCount >= 3) {
                      // 先頭の3点
                      if (_selectedIndex >= 3 && index == 1) {
                        return Container(
                          height: 45,
                          width: 20,
                          margin: const EdgeInsets.all(2),
                          child: Icon(Icons.keyboard_control_outlined),
                        );
                      }

                      // 表示しないページ
                      if (index < _selectedIndex - 1 &&
                          index != 0 &&
                          _selectedIndex > 3 &&
                          _selectedIndex != _pageCount - 1) {
                        return Container();
                      }
                    }

                    // // 後段の3点
                    // if (_pageCount >= 3 &&
                    //     index > 3 &&
                    //     _selectedIndex != index + 1 &&
                    //     _selectedIndex != index &&
                    //     _selectedIndex != index - 1 &&
                    //     index != _pageCount - 1) {
                    //   return Container(
                    //     height: 45,
                    //     width: 20,
                    //     margin: const EdgeInsets.all(2),
                    //     child: Icon(Icons.keyboard_control_outlined),
                    //   );
                    // }

                    // ボタン
                    return Container(
                      height: 45,
                      width: 45,
                      color: (index == _selectedIndex)
                          ? Colors.green
                          : Colors.amber,
                      margin: const EdgeInsets.all(2),
                      child: InkWell(
                        onTap: () {
                          print(index);

                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: _pageCount,
                ),
              ),

              // 後段の矢印
              if (_selectedIndex != _pageCount - 1)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        height: 45,
                        width: 45,
                        color: Colors.blue,
                        margin: const EdgeInsets.all(2),
                        child: InkWell(
                          onTap: () {
                            print(index);

                            setState(() {
                              _selectedIndex++;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
            ],
          ),

          // child: ListView.builder(
          //   shrinkWrap: true,
          //   // padding: const EdgeInsets.symmetric(horizontal: 100),
          //   scrollDirection: Axis.horizontal,
          //   itemCount: pageCount,
          //   itemBuilder: (context, index) {

          //     //item数が11以上、かつselectPageIndexが1以外の時

          //     if (index > 2 && index < pageCount - 2) {
          //       return Container();
          //     }
          //     if (index == pageCount - 1) {
          //       return Container(
          //         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          //         width: pagenationContainerSize,
          //         height: pagenationContainerSize,
          //         color: Colors.blue,
          //       );
          //     }

          //     if (pageCount > 3 && index == pageCount - 2) {
          //       return Container(
          //         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          //         width: pagenationContainerSize,
          //         height: pagenationContainerSize,
          //         child: Icon(Icons.keyboard_control_outlined),
          //       );
          //     }

          //     return Container(
          //       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          //       width: pagenationContainerSize,
          //       height: pagenationContainerSize,
          //       color: Colors.black,
          //     );
          //   },
          // ),
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
