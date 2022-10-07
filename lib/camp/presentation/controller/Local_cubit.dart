import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jordon/camp/data/model/all_model.dart';
import '../../../core/error/failure.dart';
import '../../domain/entity/All.dart';
import '../../domain/usecases/get_home_use_case.dart';
import 'Local_state.dart';



class LocalCubit extends Cubit<LocalState> {
  LocalCubit(this.getCampsUseCase) : super(LocalInitial());

  static LocalCubit get(context) => BlocProvider.of(context);
  final GetCampsUseCase getCampsUseCase;

All? all;



  int? maxLines = 2;
  void seeDetails() {
    maxLines = maxLines == null ? 2 : null;
    emit(SeeDetails());
  }


  Future<Either<Failure, All>> getCamps() async{
    emit(GetCampsLoadingState());
    final result = await getCampsUseCase.execute();
    result.fold((l) {
      ServerFailure(l.message);
      emit(CampsErrorState());
    }, (r) {
      all = r ;
      print(r);
      emit(CampsSuccessState());
    });
    return result;



  }


  // Future<Either<Failure, UserDataDetailsModel>> getInfo() async {
  //   emit(UserInfoLoadingState());
  //
  //   final result = await getUserInfo.call();
  //   result.fold((l) {
  //     ServerFailure(l.message);
  //     emit(HotelErrorState());
  //   }, (r) {
  //     userInfo = r;
  //     emit(UserInfoSuccessState());
  //     print(userInfo);
  //   });
  //   return result;
  // }



}
