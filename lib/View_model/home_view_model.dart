
import 'package:flutter/widgets.dart';
import 'package:mvvm/data/response/API_RESPONSE.dart';
import 'package:mvvm/model/MusicListModel.dart';
import 'package:mvvm/respositry/Home_repsitory.dart';

class HomeViewModel with ChangeNotifier{

  final _myRepo=HomeRepository();

  ApiResponse<MusicListModel> musicList = ApiResponse.loading();

  setMusic(ApiResponse<MusicListModel> response1){
    musicList = response1;
    notifyListeners();
  }
  Future<void> fetchMusicListApi() async{

     setMusic(ApiResponse.loading());
    _myRepo.fetchMusicList().then((value){
      setMusic(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMusic(ApiResponse.error(error.toString()));
    });
  }
}