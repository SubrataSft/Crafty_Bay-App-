import 'package:crafty_bay_app/data/models/network_response.dart';
import 'package:crafty_bay_app/data/models/product_list_model.dart';
import 'package:crafty_bay_app/data/models/product_model.dart';
import 'package:crafty_bay_app/data/services/network_caller.dart';
import 'package:crafty_bay_app/data/uttils/urls.dart';
import 'package:get/get.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInProgress = false;

  bool _newProdductInProgerss = false;

  bool _specialProductInProgress = false;

  bool get popularProductInProgress => _popularProductInProgress;

  bool get newProductInProgress => _newProdductInProgerss;

  bool get specialProductInProgress => _specialProductInProgress;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> _newProductList = [];
  List<ProductModel> _specialProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;

  List<ProductModel> get newProductList => _newProductList;

  List<ProductModel> get specialProductList => _specialProductList;

  String? _popularErrorMessage;
  String? _newErrorMessage;
  String? _specialErrorMessage;

  String? get popularErrorMessage => _popularErrorMessage;

  String? get newErrorMessage => _newErrorMessage;

  String? get specialErrorMessage => _specialErrorMessage;

  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;
    if (remark == "popular") {
      _popularProductInProgress = true;
    } else if (remark == "new") {
      _newProdductInProgerss = true;
    } else {
      _specialProductInProgress = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByRemark(remark),
    );
    if (response.isSuccess) {
      if (remark == "popular") {
        _popularErrorMessage = null;
        _popularProductList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      } else if (remark == "popular") {
        _newErrorMessage = null;
        _newProductList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      } else {
        _specialErrorMessage = null;
        _specialProductList =
            ProductListModel.fromJson(response.responseData).productList ?? [];
      }
      isSuccess = true;
    } else {
      if (remark == "popular") {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == "new") {
        _newErrorMessage = response.errorMessage;
      } else {
        _specialErrorMessage = response.errorMessage;
      }
    }
    if (remark == "popular") {
      _popularProductInProgress = true;
    } else if (remark == "new") {
      _newProdductInProgerss = true;
    } else {
      _specialProductInProgress = true;
    }
    update();
    return isSuccess;
  }
}
