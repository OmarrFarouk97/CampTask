import 'package:dio/dio.dart';
import '../../../core/error/exceptions.dart';
import '../model/all_model.dart';

abstract class BaseRemoteDataSource {
  Future<AllModel> getHomePage();
}



class LocalRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<AllModel> getHomePage() async{
    final response = await Dio().get('http://privatestays.jyif.org/api/properties/41');
    if (response.statusCode == 200) {
    //  print(response.data);

      return AllModel.fromJson(response.data);


        // List<AllModel>.from(((response.data) as List)
        //   .map((e) => AllModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

}

