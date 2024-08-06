
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/View_model/home_view_model.dart';
import 'package:mvvm/View_model/user_view-model.dart';
import 'package:mvvm/data/response/Status.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMusicListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 13),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.musicList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.musicList.message.toString()));
              case Status.COMPLETED:
                return Card(
                  child: ListView.builder(
                    itemCount: value.musicList.data?.tracks?.length ?? 0,
                    itemBuilder: (context, index) {
                      final track = value.musicList.data!.tracks?[index];
                      return ListTile(
                        leading: Image.network(track!.img.toString()),
                        title: Text(track!.name.toString() ?? 'name'),
                        subtitle: Text(track!.pl!.name.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(track.score.toString(),style: TextStyle(fontSize: 16),),
                            SizedBox(width: 7,),
                            Icon(Icons.star,color: Colors.orange,),
                          ],
                        ),
                      );
                    },
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
