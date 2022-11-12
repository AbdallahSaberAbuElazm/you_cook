// ignore_for_file: constant_identifier_names

const BASE_URL = 'https://youcooksa.com/youcook/api/v1/';

class ApiUrl {
  static const String BASE_URL = 'https://youcooksa.com/youcook/api/v1/';
  static const String STORAGE_URL = 'https://youcooksa.com/youcook/public/';
  static const String REGISTER_URL = '${BASE_URL}register';
  static const String LOGIN_URL = '${BASE_URL}login/';
  static const String ALL_VENDORS_URL = '${BASE_URL}vendors';
  static const String CATEGORIES_URL = '${BASE_URL}categories/';
  static const String KITCHENS_URL = '${BASE_URL}kitchens/';
  static const String PRODUCTS_URL = '${BASE_URL}all_products/';
  static const String OFFERS_URL = '${BASE_URL}offers/';
  static const String ALL_CART_URL = '${BASE_URL}cart-items';
  static const String CART_CONTENT_URL = '${BASE_URL}cart-content/';
  static const String DELETE_CART_URL = '${BASE_URL}cart-items/';
  static const String SLIDERS_URL = '${BASE_URL}sliders/';
  static const String FAVOURITES_URL = '${BASE_URL}favourites/';
  static const String ORDERS_URL = '${BASE_URL}orders/get_all/';
  static const String SEND_ORDER_URL = '${BASE_URL}orders/send/';
}
