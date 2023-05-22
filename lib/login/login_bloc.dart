import 'package:cci_app/login/login_repository.dart';
import 'package:cci_app/login/wating_screen.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final LoginRepository loginRepository = LoginRepository();

  var isLoading = false.obs;

  void login (String email, String password) async{
    isLoading.value = true;
    Map connection = await loginRepository.login(email, password);
    if (connection['status'] == 'connected'){
      isLoading.value = false;
      Get.to(() => WaitingScreen());
    }else{
      //Navigate to the forbiden page
    }
  }
}