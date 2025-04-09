class Urls {
  static String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static String dummyUrl = "$_baseUrl/login";
  static String sliderListUrl = "$_baseUrl/ListProductSlider";
  static String categoryListUrl = "$_baseUrl/CategoryList";

  static String productListByRemark(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";

  static String productListByCategory(int categoryId) =>
      "$_baseUrl/ListProductByCategory/$categoryId";

  static String productDetailsById(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";
}
