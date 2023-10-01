import 'dart:convert';

extension StringExtension on String{


  String formatTime(){
    var parts = split(":");
    return "${parts[0].trim()}:${parts[1].trim()}";
  }

  String getPercent(){
    return (double.parse(double.parse(this).toStringAsFixed(2))*100).
    toStringAsFixed(0);
  }

  String convertCharacter(){
    String editWord = this;
    editWord = editWord.replaceAll("ﺍ", "ا");
    editWord = editWord.replaceAll("ﺳ", "س");
    editWord = editWord.replaceAll("ﮑ", "ک");
    editWord = editWord.replaceAll("ﯿ", "ی");
    editWord = editWord.replaceAll("ﻦ", "ن");
    editWord = editWord.replaceAll("ﺧ", "خ");
    editWord = editWord.replaceAll("ﻂ", "ط");
    editWord = editWord.replaceAll("ﮐ", "ک");
    editWord = editWord.replaceAll("ﻼ", "لا");
    editWord = editWord.replaceAll("ﻑ", "ف");
    editWord = editWord.replaceAll("ﺿ", "ض");
    editWord = editWord.replaceAll("ﺨ", "خ");
    editWord = editWord.replaceAll("ﺎ", "ا");
    editWord = editWord.replaceAll("ﻣ", "م");
    editWord = editWord.replaceAll("ﺖ", "ت");
    editWord = editWord.replaceAll("ﻄ", "ط");
    editWord = editWord.replaceAll("ﻮ", "و");
    editWord = editWord.replaceAll("ﻁ", "ط");
    editWord = editWord.replaceAll("ﺪ", "د");
    editWord = editWord.replaceAll("ﺷ", "ش");
    editWord = editWord.replaceAll("ﻮ", "ش");
    editWord = editWord.replaceAll("ﯾ", "ی");
    editWord = editWord.replaceAll("ﯽ", "ی");
    editWord = editWord.replaceAll("ﭘ", "پ");
    editWord = editWord.replaceAll("ا", "ا");
    editWord = editWord.replaceAll("ﺱ", "س");
    editWord = editWord.replaceAll("ﺮ", "ر");
    editWord = editWord.replaceAll("ﺩ", "د");
    editWord = editWord.replaceAll("ﺰ", "ز");
    editWord = editWord.replaceAll("ﺭ", "ر");
    editWord = editWord.replaceAll("ﯼ", "ی");
    editWord = editWord.replaceAll("ﺁ", "آ");
    editWord = editWord.replaceAll("ﻧ", "ن");
    editWord = editWord.replaceAll("ﻞ", "ل");
    editWord = editWord.replaceAll("ﻟ", "ل");
    editWord = editWord.replaceAll("ﺗ", "ت");
    editWord = editWord.replaceAll("ﻩ", "ه");
    editWord = editWord.replaceAll("ﮔ", "گ");
    editWord = editWord.replaceAll("ﺒ", "ب");
    editWord = editWord.replaceAll("ﻡ", "م");
    editWord = editWord.replaceAll("ﻐ", "غ");
    editWord = editWord.replaceAll("ﺑ", "ب");
    editWord = editWord.replaceAll("ﺸ", "ش");
    editWord = editWord.replaceAll("ﺘ", "ت");
    editWord = editWord.replaceAll("ﻥ", "ن");
    editWord = editWord.replaceAll("ﮊ", "ژ");
    editWord = editWord.replaceAll("ﻬ", "ه");
    editWord = editWord.replaceAll("ﻓ", "ف");
    editWord = editWord.replaceAll("ﺽ", "ض");
    editWord = editWord.replaceAll("ﻨ", "ن");
    editWord = editWord.replaceAll("ﺏ", "ب");
    editWord = editWord.replaceAll("ﺵ", "ش");
    editWord = editWord.replaceAll("ﻗ", "ق");
    editWord = editWord.replaceAll("ﻋ", "ع");
    editWord = editWord.replaceAll("ﻠ", "ل");
    editWord = editWord.replaceAll("ﺲ", "س");
    editWord = editWord.replaceAll("ﺞ", "ج");
    editWord = editWord.replaceAll("ﻫ", "ه");
    editWord = editWord.replaceAll("ﻔ", "ف");
    editWord = editWord.replaceAll("ﻌ", "ع");
    editWord = editWord.replaceAll("ﺻ", "ص");
    editWord = editWord.replaceAll("ﻭ", "و");
    editWord = editWord.replaceAll("ﻤ", "م");
    editWord = editWord.replaceAll("ﺕ", "ت");
    editWord = editWord.replaceAll("ﻝ", "ل");
    editWord = editWord.replaceAll("ﺣ", "ح");
    editWord = editWord.replaceAll("ﺣ", "ح");
    editWord = editWord.replaceAll("ﺛ", "ث");
    editWord = editWord.replaceAll("ﻪ", "ه");
    editWord = editWord.replaceAll("ﺐ", "ب");
    editWord = editWord.replaceAll("ﻏ", "غ");
    editWord = editWord.replaceAll("ﻃ", "ط");
    editWord = editWord.replaceAll("ﺡ", "ح");
    editWord = editWord.replaceAll("ﺠ", "ج");
    editWord = editWord.replaceAll("ﻘ", "ق");
    editWord = editWord.replaceAll("ﻘ", "ق");
    editWord = editWord.replaceAll("ﻊ", "ع");
    editWord = editWord.replaceAll("ﺯ", "ز");
    editWord = editWord.replaceAll("ﮕ", "گ");
    editWord = editWord.replaceAll("ﺴ", "س");
    editWord = editWord.replaceAll("ﻢ", "م");
    editWord = editWord.replaceAll("ﻉ", "ع");
    editWord = editWord.replaceAll("ﻉ", "ع");
    editWord = editWord.replaceAll("ﺫ", "ذ");
    editWord = editWord.replaceAll("ﺫ", "ذ");
    editWord = editWord.replaceAll("ﻀ", "ض");
    editWord = editWord.replaceAll("ﻀ", "ض");
    editWord = editWord.replaceAll("ﺟ", "ج");
    editWord = editWord.replaceAll("ﻻ", "لا");
    editWord = editWord.replaceAll("ﺼ", "ص");
    editWord = editWord.replaceAll("ﮒ", "گ");
    editWord = editWord.replaceAll("ﺬ", "ذ");
    editWord = editWord.replaceAll("ﻕ", "ق");
    editWord = editWord.replaceAll("ﺤ", "ح");
    editWord = editWord.replaceAll("ﺶ", "ش");
    editWord = editWord.replaceAll("ﻒ", "ف");
    editWord = editWord.replaceAll("ﺝ", "ج");
    editWord = editWord.replaceAll("ﭼ", "چ");
    editWord = editWord.replaceAll("ﭖ", "پ");
    editWord = editWord.replaceAll("ﮎ", "ک");
    editWord = editWord.replaceAll("ﻎ", "غ");
    editWord = editWord.replaceAll("ﺦ", "خ");
    editWord = editWord.replaceAll("ﺋ", "ئ");
    editWord = editWord.replaceAll("ﮏ", "ک");
    editWord = editWord.replaceAll("ﻈ", "ظ");
    editWord = editWord.replaceAll("ﮓ", "گ");
    editWord = editWord.replaceAll("ﺺ", "ص");
    editWord = editWord.replaceAll("ﺢ", "ح");
    editWord = editWord.replaceAll("ﺜ", "ث");
    editWord = editWord.replaceAll("ﺾ", "ض");
    editWord = editWord.replaceAll("ﭙ", "پ");
    editWord = editWord.replaceAll("ﭗ", "پ");
    return editWord;
  }

  String getStatusPersianName(){
    switch(toUpperCase()){
      case "TO DO":
        return "در نوبت انجام";
      case "IN PROGRESS":
        return "درحال انجام";
      case "CLOSED":
        return "بسته شده";
      case "DONE":
        return "انجام شده";
      case "RESOLVED":
        return "حل شده";
      case "CANCELLED":
        return "حذف شده";
      case "REJECTED":
        return "رد شده";
      case "IN REVIEW":
        return "در حال بازبینی";
      case "WAIT FOR ESTIMATION":
        return "منتظر ثبت برآورد";
      case "WAIT FOR ESTIMATION CONFIRM":
        return "منتظر تایید برآورد";
      case "WAIT FOR COMPLETE DATA":
        return "منتظر تکمیل یا اصلاح اطلاعات";
      case "WAIT FOR RE-ESTIMATION":
        return "منتظر برآورد مجدد";
      case "WAIT FOR DUEDATE":
        return "منتظر ثبت سررسید";
      default:
        return "-";
    }
  }


  Map<String, dynamic> parseIdToken() {
    final List<String> parts = split('.');
    assert(parts.length == 3);
    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  String formatTimePicker(){
    String time = this;
    if(time.contains("ب.ظ")){
      time = time.replaceAll("ب.ظ", '');
      List<String> timeList = time.split(":");
      String hour = (int.parse(timeList[0]) + 12).toString().padLeft(2, '0');
      time = "$hour:${timeList[1].padLeft(2, '0')}";
    }else{
      time = time.replaceAll("ق.ظ", "");
      List<String> timeList = time.split(":");
      time = "${timeList[0].padLeft(2, '0')}:${timeList[1]}";
    }
    return time;
  }
}