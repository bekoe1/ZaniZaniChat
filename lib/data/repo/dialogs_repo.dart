import 'package:bloc_test_app/data/repo/auth_repo.dart';

class DialogsRepo{
   static Future<void> GetDialogs(){
      final response = AuthRepository.dio.get("path");
      //toDo parseFromJsonToModel
     return response;
   }
}
