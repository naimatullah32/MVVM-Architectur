

import 'package:mvvm/model/MusicListModel.dart';

import '../data/network/BaseApiUrl.dart';
import '../data/network/NetworkApiService.dart';
import '../resources/components/App_url.dart';

class HomeRepository{

  BaseApiServices _ApiServices = Networkapiservice();

  Future<MusicListModel> fetchMusicList() async {

    try {
      dynamic response = await _ApiServices.getGetApiResponse(AppUrl.musicListEndPoint);

      return response=MusicListModel.fromJson(response);

    } catch (e) {

      throw e;

    }
  }

}