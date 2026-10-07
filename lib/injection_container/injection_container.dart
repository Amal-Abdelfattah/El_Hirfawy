import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/dio_client.dart';
import '../core/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<Dio>(
    DioClient.create,
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfo(
      Connectivity(),
    ),
  );
}