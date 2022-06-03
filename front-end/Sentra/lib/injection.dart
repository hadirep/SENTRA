import 'package:get_it/get_it.dart';
import 'package:sentra/data/datasources/art_local_data_source.dart';
import 'package:sentra/data/datasources/art_remote_data_source.dart';
import 'package:sentra/data/datasources/database/database_helper.dart';
import 'package:sentra/data/repositories/art_repository_impl.dart';
import 'package:sentra/domain/repositories/art_repository.dart';
import 'package:sentra/domain/usecases/get_arts.dart';
import 'package:sentra/domain/usecases/get_detail.dart';
import 'package:sentra/domain/usecases/get_favorite_arts.dart';
import 'package:sentra/domain/usecases/get_favorite_status.dart';
import 'package:sentra/domain/usecases/get_province.dart';
import 'package:sentra/domain/usecases/get_update.dart';
import 'package:sentra/domain/usecases/remove_favorite.dart';
import 'package:sentra/domain/usecases/save_favorite.dart';
import 'package:sentra/domain/usecases/search_arts.dart';
import 'package:sentra/presentation/bloc/arts/arts_bloc.dart';
import 'package:sentra/presentation/bloc/detail/detail_bloc.dart';
import 'package:sentra/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:sentra/presentation/bloc/province/province_bloc.dart';
import 'package:sentra/presentation/bloc/search/search_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sentra/presentation/bloc/update/update_bloc.dart';

final locator = GetIt.instance;

void init()  {
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
    locator.registerFactory(
    () => FavoriteBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailBloc(
      getDetailArt: locator(),
      saveFavoriteArts: locator(),
      removeFavoriteArts: locator(),
      getFavoriteStatusArt: locator(),
    ),
  );
  
  
  /// use case
  locator.registerLazySingleton(() => GetProvince(locator()));
  locator.registerLazySingleton(() => GetUpdate(locator()));
  locator.registerLazySingleton(() => GetArts(locator()));
  locator.registerLazySingleton(() => SearchArt(locator()));
  locator.registerLazySingleton(() => GetDetailArt(locator()));
  locator.registerLazySingleton(() => GetFavoriteArts(locator()));
  locator.registerLazySingleton(() => GetFavoriteStatus(locator()));
  locator.registerLazySingleton(() => RemoveFavoriteArts(locator()));
  locator.registerLazySingleton(() => SaveFavoriteArts(locator()));
  


  /// repository
  locator.registerLazySingleton<ArtRepository>(
    () => ArtRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  
  /// data sources
  locator.registerLazySingleton<ArtRemoteDataSource>(
    () => ArtRemoteDataSourceImpl(client: locator())
  );
  locator.registerLazySingleton<ArtLocalDataSource>(
    () => ArtLocalDataSourceImpl(databaseHelper: locator())
  );

  //helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  /// external
  locator.registerLazySingleton(() => http.Client());
}
