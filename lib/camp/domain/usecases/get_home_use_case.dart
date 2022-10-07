import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/All.dart';
import '../repository/base_local_repository.dart';

class GetCampsUseCase{
  final BaseLocalRepository baseLocalRepository;

  GetCampsUseCase(this.baseLocalRepository);

  Future<Either<Failure,All>> execute ()
  async{
    return await baseLocalRepository.getCampPage();
  }

}