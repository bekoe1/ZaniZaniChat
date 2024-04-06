import '../models/my_account_info.dart';

abstract class AccountInfoRepo{
  Future<String?> changeUsername(String data);
  Future<String?> changeSurname(String data);
  Future<String?> changeNickname(String data);
  Future<String?> changePicture(String data);
  Future<String?> changeDescription(String data);
  Future<MyAccountInfoData?> getData();
}