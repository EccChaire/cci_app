import 'package:cci_app/login/login_repository.dart';
import 'package:get/get.dart';
import 'package:cci_app/collecte/collecte_screen.dart';


class LoginController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();

  var isLoading = false.obs;

  void login (String email, String password) async{
    isLoading.value = true;
    Map connection = await loginRepository.login(email, password);
    if (connection['status'] == 'connected'){
      isLoading.value = false;
      Get.to(() => CollectePage());
    }else{
      //Navigate to the forbiden page
    }
  }
}