import '../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entity/All.dart';

abstract class BaseLocalRepository{
 Future<Either<Failure,All>> getCampPage();
}
