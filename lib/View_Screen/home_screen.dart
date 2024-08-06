
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/View_model/home_view_model.dart';
import 'package:mvvm/View_model/user_view-model.dart';

import 'package:mvvm/data/response/Status.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeViewModel homeViewModel=HomeViewModel();
  //
  // @override
  // void initState() {
  //   // TODO: Handle this case.
  //   homeViewModel.fetchMusicListApi();
  //   super.initState();

  // }


  @override
  Widget build(BuildContext context) {
    final userPreference=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                userPreference.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });

              },
              child: Text("log Out",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white
              ),)),
          SizedBox(width: 13,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(),
    child: Consumer<HomeViewModel>(
    builder: (context, value, child) {
      switch (value.musicList.status) {
        case Status.LOADING:
          return Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return Text(value.musicList.message.toString());
        case Status.COMPLETED:
          return Text("data");
          // case Status.LOADING:
          //   return CircularProgressIndicator();
          // case Status.COMPLETED:
          //   return
          //     ListView.builder(
          //     itemCount: viewModel.musicList.data!.tracks!.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(viewModel.musicList.data!.tracks![index].id
          //             .toString()),
          //       );
          //     },
          //   );
          // case Status.ERROR:
          //   return Text('Error: ${viewModel.musicList.message}');
          // default:
        case null:
        // TODO: Handle this case.
      }
      return Container();
    }
    )
      )
    );
  }
}
