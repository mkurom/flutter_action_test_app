import 'package:flutter_action_test_app/pagenation_list_view/page_model.dart';

final PagingProductRepository pagingProductRepository =
    PagingProductRepository();

List<PagingProduct> populateData() {
  final List<PagingProduct> pagingProducts = [];
  var index = 0;
  for (int i = 0; i < pagingProductRepository.names.length; i++) {
    if (index == 21) index = 0;

    var p = new PagingProduct(
      name: pagingProductRepository.names[i],
    );

    index++;
    pagingProducts.add(p);
  }

  return pagingProducts;
}
