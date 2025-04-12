class Urls {
  static String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static String dummyUrl = "$_baseUrl/login";
  static String sliderListUrl = "$_baseUrl/ListProductSlider";
  static String categoryListUrl = "$_baseUrl/CategoryList";
  static String readProfileUrl = "$_baseUrl/ReadProfile";
  static String addToCart = "$_baseUrl/CreateCartList";

  static String productListByRemark(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";

  static String productListByCategory(int categoryId) =>
      "$_baseUrl/ListProductByCategory/$categoryId";

  static String productDetailsById(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";

  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";

  static String verifyOtp(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";
}
