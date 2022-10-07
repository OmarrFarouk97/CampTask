import 'package:get_it/get_it.dart';
import 'package:jordon/camp/data/datasource/remote_datasource.dart';
import 'package:jordon/camp/data/repository/local_repository.dart';
import 'package:jordon/camp/domain/repository/base_local_repository.dart';
import 'package:jordon/camp/presentation/controller/Local_cubit.dart';

import '../../camp/domain/usecases/get_home_use_case.dart';


final sl=GetIt.instance;
class ServiceLocator{
  void init(){

    ///bloc
   sl.registerFactory(() => LocalCubit(sl()));

    /// Use Case
   sl.registerLazySingleton(() => GetCampsUseCase( sl() ));

   /// Repository
   sl.registerLazySingleton<BaseLocalRepository>(
           () => LocalRepository(sl()));
   /// Data Source
   sl.registerLazySingleton<BaseRemoteDataSource>(() => LocalRemoteDataSource());
  }
}
