import 'package:flutter/material.dart';
import 'package:jordon/camp/data/datasource/remote_datasource.dart';
import 'package:jordon/camp/data/repository/local_repository.dart';
import 'package:jordon/camp/domain/repository/base_local_repository.dart';
import 'package:jordon/camp/domain/usecases/get_home_use_case.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }



    _getData()async {
      BaseRemoteDataSource baseRemoteDataSource =LocalRemoteDataSource();

      BaseLocalRepository localRepository= LocalRepository(baseRemoteDataSource);
      final result= await GetCampsUseCase(localRepository).execute();
      print(result);

    }
  }


