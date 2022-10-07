import 'package:dartz/dartz.dart';
import 'package:jordon/camp/domain/entity/All.dart';
import 'package:jordon/core/error/failure.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/repository/base_local_repository.dart';
import '../datasource/remote_datasource.dart';

class LocalRepository extends BaseLocalRepository{
  final BaseRemoteDataSource baseLocalRemoteDataSource;
  LocalRepository(this.baseLocalRemoteDataSource);


  @override
  Future<Either<Failure, All>> getCampPage() async{
    final result=await baseLocalRemoteDataSource.getHomePage();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }





}





