import 'package:get_it/get_it.dart';
import 'package:sentra/data/datasources/art_remote_data_source.dart';
import 'package:sentra/data/repositories/art_repository_impl.dart';
import 'package:sentra/domain/repositories/art_repository.dart';
import 'package:sentra/domain/usecases/get_arts.dart';
import 'package:sentra/domain/usecases/get_province.dart';
import 'package:sentra/domain/usecases/get_update.dart';
import 'package:sentra/domain/usecases/search_arts.dart';
import 'package:sentra/presentation/bloc/arts/arts_bloc.dart';
import 'package:sentra/presentation/bloc/province/province_bloc.dart';
import 'package:sentra/presentation/bloc/search/search_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sentra/presentation/bloc/update/update_bloc.dart';

final locator = GetIt.instance;

void init() async {
  /// bloc
  locator.registerFactory(
    () => ProvinceBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => UpdateBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ArtsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchBloc(
      locator(),
    ),
  );
  
  /// use case
  locator.registerLazySingleton(() => GetProvince(locator()));
  locator.registerLazySingleton(() => GetUpdate(locator()));
  locator.registerLazySingleton(() => GetArts(locator()));
  locator.registerLazySingleton(() => SearchArt(locator()));

  /// repository
  locator.registerLazySingleton<ArtRepository>(
    () => ArtRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  
  /// data sources
  locator.registerLazySingleton<ArtRemoteDataSource>(
    () => ArtRemoteDataSourceImpl(client: locator())
  );

  /// external
  locator.registerLazySingleton(() => http.Client());
}
