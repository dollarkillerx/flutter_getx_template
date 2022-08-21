import 'package:get/get.dart';
import '../entity/gener_resp.dart';
import '../routes/app_routes.dart';
import '../storage/user.dart';

const SERVER_API_URL = "http://192.168.31.50:8574/api/v1";

class NetTools {
  static String? CheckError(Map<String, dynamic> postsJson) {
    GenericResp posts = GenericResp.fromJson(postsJson);
    if (posts.code != "0") {
      return posts.message;
    }
    return null;
  }
}

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = SERVER_API_URL;

    // 请求拦截
    httpClient.addRequestModifier<void>((request) async {
      String? rx = await AppData.getJWT();
      if (rx != null) {
        request.headers['Authorization'] = rx;
      }

      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier((request, response) {
      if (response.status.code! == 401) {
        Get.toNamed(AppRoutes.Login);
      }
      return response;
    });
  }
}
