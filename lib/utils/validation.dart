abstract class Validation{
  static String? ValidateEmail(String email){
    if(email.isEmpty){
      return "Введите данные";
    }

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if(!regex.hasMatch(email)){
      return "Некорректный email";
    }

    return null;
  }
  static String? ValidateUsername(String username){
    if(username.isEmpty){
      return "Введитее данные";
    }

    String pattern = r'^[a-zA-Z]{4,}\d*$';
    RegExp regEx = RegExp(pattern);
    if(!regEx.hasMatch(username)){
      return "Некорректное имя пользователя";
    }
  }
  static String? ValidateNumber(String number){
    if(number.isEmpty){
      return "Введитее данные";
    }

    String pattern = r"^(?:\+7|8)\s?\(?\d{3}\)?[\s-]?\d{3}[\s-]?\d{2}[\s-]?\d{2}$";
    RegExp regEx = RegExp(pattern);
    if(!regEx.hasMatch(number)){
      return "Некорректный номер";
    }

    return null;
  }
  static String? ValidatePass(String password){
    if(password.isEmpty){
      return "Введите данные";
    }

    // RegExp passwordRegExp = new RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\-=[\]{};:.<>?]).{6,}$');
    // if(!passwordRegExp.hasMatch(password)){
    //   return "Некорректный пароль";
    // }

    RegExp onlyCapsLetters = new RegExp(r'[A-Z]+');
    if(!onlyCapsLetters.hasMatch(password)){
      return "Введите хотя бы одну заглавную букву";
    }

    RegExp onlyNumber = new RegExp(r'[\d+]');
    if(!onlyNumber.hasMatch(password)){
      return "Введите хотя бы одну цифру";
    }

    RegExp onlySymbols = new RegExp(r'[^\w\s]');
    if(!onlySymbols.hasMatch(password)){
      return "Введите хотя бы один символ";
    }

    RegExp moreThanSix = new RegExp(r'.{6,}');
    if(!moreThanSix.hasMatch(password)){
      return "Пароль слишком короткий";
    }

    return null;
  }
}