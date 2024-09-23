import 'package:dio/dio.dart';
import  'package:rubyscore/constants/strings.dart';
class Api {
 late Dio dio;

 Api() {
   BaseOptions options = BaseOptions(
     baseUrl: baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: Duration(seconds: 16),
     receiveTimeout: Duration(seconds: 16),
   );

   dio = Dio(options);
 }
   Future<List<dynamic>> getAllFootball() async {
  try {
    Response response = await dio.get('live', options: Options(
      headers: {
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': apiHost,
      },
    ));

    // Access the 'events' key from the response data
    return response.data['events'] ?? []; // Return an empty list if 'events' is null
  } catch (e) {
    print(e.toString());
    return [];
  }
}
 }
