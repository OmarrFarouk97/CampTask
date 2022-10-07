import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/info_widget.dart';
import '../controller/Local_cubit.dart';
import '../controller/Local_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalCubit, LocalState>(
        listener: (context, state) {},
      builder: (context, state) {
      final cubit = LocalCubit.get(context);
       if (state is CampsSuccessState) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.amberAccent,
              title: Text(cubit.all!.title),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                  indicatorWeight: 2,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [Text('Info' , style: TextStyle(fontSize: 20),), Text('Reviews' ,style: TextStyle(fontSize: 20))]),
            ),
            body: TabBarView(
              children: [
                InfoWidget(),
                Container(
                  color: Colors.grey,
                )
              ],
            )),
      );
        }
        else {
          return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
        }
      },
    );
  }
}