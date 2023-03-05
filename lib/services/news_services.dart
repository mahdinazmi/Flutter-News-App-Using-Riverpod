import 'package:dio/dio.dart';
import 'package:news_app_using_riverpod/constants/constants.dart';

class NewsService {

   final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json
    )
  );

  fetchNews() async {

    var response = await _dio.get('v2/top-headlines?country=us&apiKey=094abddfda1944fb87d868677f3005ee');

    return response.data;

  }
  
  fetchNewsBySearching(String title) async {

    var response = await _dio.get('v2/everything?q='+title+'&apiKey=094abddfda1944fb87d868677f3005ee');

    return response.data;
  }

}