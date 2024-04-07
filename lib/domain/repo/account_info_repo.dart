import '../models/my_account_info.dart';

abstract class AccountInfoRepo{
  Future<String?> changeUsername(String data);
  Future<String?> changeNameAndSurname(String name, String surname);
  Future<String?> changePicture(String data);
  Future<String?> changeDescription(String data);
  Future<MyAccountInfoData?> getData();
}