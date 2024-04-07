class ApiEndPoints {
  static const String baseUrl = 'http://10.0.2.2:8989';
  static const String sellerRegister = '/seller/register';
  static const String sellerLogin = '/seller/login';
  static const getSellerProfile = '/seller/profile';
  static const addDish = '/seller/addDish';
  static const dailyStatus = '/seller/sales?filter=daily';
  static const totelStatus = '/seller/sales';
  static const categories = '/categories';
  static const getDishesByCategory = '/seller/dishes?category=';
  static const deleteOrUpdateDish = '/seller/dishes/';
  static const addOffers = '/seller/offers/addOffer';
  static const getAllOffers = '/seller/offers';
}
