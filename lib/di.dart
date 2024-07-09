import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app/features/product/data/datasource/product_remote_datasource.dart';
import 'app/features/product/data/repository_impl/product_repository_impl.dart';
import 'app/features/product/domain/repository/product_repository.dart';
import 'app/features/product/domain/usecase/get_all_product.dart';
import 'app/features/product/presentation/bloc/product_bloc.dart';
import 'app/features/profile/data/datasource/profile_remote_datasource.dart';
import 'app/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'app/features/profile/domain/repository/profile_repository.dart';
import 'app/features/profile/domain/usecase/get_profile.dart';
import 'app/features/profile/domain/usecase/update_profile.dart';
import 'app/features/profile/presentation/bloc/profile_bloc.dart';
import 'app/features/shop/data/datasource/shop_remote_datasource.dart';
import 'app/features/shop/data/repository_impl/shop_repository_impl.dart';
import 'app/features/shop/domain/repository/shop_repository.dart';
import 'app/features/shop/domain/usecase/get_shop_by_id.dart';
import 'app/features/shop/presentation/bloc/shop_bloc.dart';
import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'app/core/device/device_config.dart';
import 'app/features/auth/domain/usecase/login_user.dart';
import 'app/features/auth/domain/usecase/logout_user.dart';
import 'app/features/auth/presentation/bloc/auth_bloc.dart';
import 'app/features/auth/domain/usecase/register_user.dart';
import 'app/features/auth/domain/usecase/user_auth_status.dart';
import 'app/features/auth/domain/repository/auth_repository.dart';
import 'app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'app/features/auth/data/repository_impl/auth_repository_impl.dart';

final locator = GetIt.instance;

//* main
Future initDependencies() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Device.initConfig();

  Bloc.observer = Observer();

  packageDependencies();
  authDependencies();
  profileDependencies();
  shopDependencies();
  productDependencies();

  await locator.allReady();
}

//* package
void packageDependencies() {
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseStorage.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => InternetConnectionChecker());
}

//* auth
void authDependencies() {
  // bloc
  locator.registerFactory(
    () => AuthBloc(
      loginUser: locator<LoginUser>(),
      logoutUser: locator<LogoutUser>(),
      registerUser: locator<RegisterUser>(),
      userAuthStatus: locator<UserAuthStatus>(),
    ),
  );
  // usecase
  locator.registerLazySingleton(
    () => LoginUser(authRepository: locator<AuthRepository>()),
  );
  locator.registerLazySingleton(
    () => RegisterUser(authRepository: locator<AuthRepository>()),
  );
  locator.registerLazySingleton(
    () => LogoutUser(authRepository: locator<AuthRepository>()),
  );
  locator.registerLazySingleton(
    () => UserAuthStatus(authRepository: locator<AuthRepository>()),
  );
  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      auth: locator<FirebaseAuth>(),
      firestore: locator<FirebaseFirestore>(),
      authRemote: locator<AuthRemoteDatasource>(),
      connection: locator<InternetConnectionChecker>(),
    ),
  );
  // datasource
  locator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(auth: locator<FirebaseAuth>()),
  );
}

//* profile
void profileDependencies() {
  // bloc
  locator.registerFactory(
    () => ProfileBloc(
      getProfile: locator<GetProfile>(),
      updateProfile: locator<UpdateProfile>(),
    ),
  );
  // usecase
  locator.registerLazySingleton(
    () => GetProfile(profileRepository: locator<ProfileRepository>()),
  );
  locator.registerLazySingleton(
    () => UpdateProfile(profileRepository: locator<ProfileRepository>()),
  );
  // repository
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      auth: locator<FirebaseAuth>(),
      storage: locator<FirebaseStorage>(),
      remoteProfile: locator<ProfileRemoteDatasource>(),
      connection: locator<InternetConnectionChecker>(),
    ),
  );
  // datasource
  locator.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(
      auth: locator<FirebaseAuth>(),
      firestore: locator<FirebaseFirestore>(),
    ),
  );
}

//* shop
void shopDependencies() {
  // bloc
  locator.registerFactory(
    () => ShopBloc(
      getToko: locator<GetShopById>(),
    ),
  );
  // usecase
  locator.registerLazySingleton(
    () => GetShopById(
      shopRepository: locator<ShopRepository>(),
    ),
  );
  // repository
  locator.registerLazySingleton<ShopRepository>(
    () => ShopRepositoryImpl(
      shopRemote: locator<ShopRemoteDatasource>(),
      connection: locator<InternetConnectionChecker>(),
    ),
  );
  // datasource
  locator.registerLazySingleton<ShopRemoteDatasource>(
    () => ShopRemoteDatasourceImpl(
      firestore: locator<FirebaseFirestore>(),
    ),
  );
}

//* product
void productDependencies() {
  // bloc
  locator.registerFactory(
    () => ProductBloc(
      getAllProduct: locator<GetAllProduct>(),
    ),
  );
  // usecase
  locator.registerLazySingleton(
    () => GetAllProduct(
      productRepository: locator<ProductRepository>(),
    ),
  );
  // repository
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteProduct: locator<ProductRemoteDatasource>(),
      connection: locator<InternetConnectionChecker>(),
    ),
  );
  // datasource
  locator.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(
      firestore: locator<FirebaseFirestore>(),
    ),
  );
}
