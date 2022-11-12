import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/features/relish/data/data_sources/cart_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/category_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/favourite_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/kitchen_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/offer_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/order_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/product_remote_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/user_service_remote_data_source.dart';
import 'package:you_cook/features/relish/data/repositories/cart_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/category_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/favourite_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/kitchen_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/offer_model_repostory.dart';
import 'package:you_cook/features/relish/data/repositories/order_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/product_model_repository.dart';
import 'package:you_cook/features/relish/data/repositories/user_service_model_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/category_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/favourite_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/kitchen_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/oder_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/offer_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/product_repository.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/add_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/delete_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/cart_usecase/get_all_cart_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/add_favourite_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/delete_favourite_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/get_all_favourite_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_categories_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_kitchens_usercase.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_offers_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_products_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/add_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/delete_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/order_usecase/get_all_order_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/login_user_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/logout_user_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/user_usecase/register_user_usecase.dart';
import 'package:you_cook/features/relish/presentation/controllers/cart_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/category_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/favourite_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/kitchen_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/offer_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/order_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/product_controller.dart';
import 'package:you_cook/features/relish/presentation/controllers/user_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - relish

  //! user service
  //controller
  sl.registerFactory(() => UserController(
      loginUserServiceUsecase: sl(),
      logoutUserServiceUsecase: sl(),
      registerUserServiceUsecase: sl()));

  //usecases
  sl.registerLazySingleton(
      () => RegisterUserServiceUsecase(userServiceRepository: sl()));
  sl.registerLazySingleton(
      () => LoginUserServiceUsecase(userServiceRepository: sl()));
  sl.registerLazySingleton(
      () => LogoutUserServiceUsecase(userServiceRepository: sl()));

  sl.registerLazySingleton<UserServiceRepository>(() =>
      UserServiceModelRepository(
          networkInfo: sl(), userServiceRemoteDataSource: sl()));
  sl.registerLazySingleton<UserServiceRemoteDataSource>(
      () => UserServiceRemoteDataSource(client: sl()));

  //! category
  //controller
  sl.registerFactory(() => CategoryController(categoryUsecase: sl()));
  // bloc
  // sl.registerFactory(() => CategoryBloc(getAllCategories: sl()));
  //usecases
  sl.registerLazySingleton(() => GetAllCategoryUsecase(sl()));
  // repositories
  sl.registerLazySingleton<CategoryRepository>(() => CategoryModelRepository(
      categoryRemoteDataSource: sl(), networkInfo: sl()));

  // datasourses
  sl.registerLazySingleton<CategoryRemoteDataSourceImpl>(
      () => CategoryRemoteDataSourceImpl(client: sl()));

  //! kitchen
  //controller
  sl.registerFactory(() => KitchenController(getAllKitchensUsecase: sl()));
  //bloc
  // sl.registerFactory(() => KitchenBloc(getAllKitchens: sl()));
  //usecases
  sl.registerLazySingleton(() => GetAllKitchensUsecase(sl()));
  //repositories
  sl.registerLazySingleton<KitchenRepository>(
      () => KitchenModelRepository(sl(), sl()));
  sl.registerLazySingleton<KitchenRemoteDataSourceImpl>(
      () => KitchenRemoteDataSourceImpl(client: sl()));

  //! product
  //controller
  sl.registerFactory(() => ProductController(getAllProductsUsecase: sl()));
  //bloc
  // sl.registerFactory(() => ProductBloc(getAllProducts: sl()));
  //usecases
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  //repositories
  sl.registerLazySingleton<ProductRepository>(
      () => ProductModelRepository(sl(), sl()));
  sl.registerLazySingleton<ProductRemoteDataSourceImpl>(
      () => ProductRemoteDataSourceImpl(client: sl()));

  //! offer
  //controller
  sl.registerFactory(() => OfferController(getAllOfferUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllOfferUsecase(sl()));
  //repositories
  sl.registerLazySingleton<OfferRepository>(
      () => OfferModelRepository(sl(), sl()));
  sl.registerLazySingleton<OfferRemoteDataSourceImpl>(
      () => OfferRemoteDataSourceImpl(client: sl()));

  //! cart
  //controller
  sl.registerFactory(() => CartController(
      addCartRepository: sl(),
      deleteCartUsecase: sl(),
      getAllCartUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllCartUsecase(sl()));
  sl.registerLazySingleton(() => AddCartUsecase(sl()));
  sl.registerLazySingleton(() => DeleteCartUsecase(sl()));
  //repositories
  sl.registerLazySingleton<CartRepository>(
      () => CartModelRepository(cartRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CartRemoteDataSourceImpl>(
      () => CartRemoteDataSourceImpl(client: sl()));

  //! order
  //controller
  sl.registerFactory(() => OrderController(
      addOrderUsecase: sl(),
      deleteOrderUsecase: sl(),
      getAllOrderUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllOrderUsecase(sl()));
  sl.registerLazySingleton(() => AddOrderUsecase(sl()));
  sl.registerLazySingleton(() => DeleteOrderUsecase(sl()));
  //repositories
  sl.registerLazySingleton<OrderRepository>(
      () => OrderModelRepository(sl(), sl()));
  sl.registerLazySingleton<OrderRemoteDataSourceImpl>(
      () => OrderRemoteDataSourceImpl(client: sl()));

  //! favourite
  //controller
  sl.registerFactory(() => FavouriteController(
      favouriteUsecase: sl(),
      addFavouriteUsecase: sl(),
      deleteFavouriteUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllFavouriteUsecase(sl()));
  sl.registerLazySingleton(() => AddFavouriteUsecase(sl()));
  sl.registerLazySingleton(() => DeleteFavouriteUsecase(sl()));

  //repositories
  sl.registerLazySingleton<FavouriteRepository>(() => FavouriteModelRepository(
      favouriteRemoteDataSourceImpl: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FavouriteRemoteDataSourceImpl>(
      () => FavouriteRemoteDataSourceImpl(client: sl()));
  //! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //! Exteranl
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => http.Client());
}
