/// 通用方法
class CommonUtil{

  /// 密码必须是大小写字母+数字+长度不小于8位
  static bool checkPassword(String password){
    int matchCount = 0;
    if(password == null){
      return false;
    }
    RegExp upperAlphaExp = new RegExp("[A-Z]");
    if(upperAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp lowerAlphaExp = new RegExp("[a-z]");
    if(lowerAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp numberExp = new RegExp("[0-9]");
    if(numberExp.hasMatch(password)){
      ++matchCount;
    }
    if(password.length < 8 || matchCount < 3){
      return false;
    }
    return true;
  }

  /// 密码的验证，返回错误结果
  static String checkPasswordResult(String password){
    int matchCount = 0;
    if(password.isEmpty){
      return '请输入密码';
    }
    RegExp upperAlphaExp = new RegExp("[A-Z]");
    if(upperAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp lowerAlphaExp = new RegExp("[a-z]");
    if(lowerAlphaExp.hasMatch(password)){
      ++matchCount;
    }
    RegExp numberExp = new RegExp("[0-9]");
    if(numberExp.hasMatch(password)){
      ++matchCount;
    }
    if(password.length < 8 || matchCount < 3){
      return '密码不合法：必须包含大小写字母和数字且长度大于8';
    }
    return null;
  }

  /// 检查再次确认填写的密码与原有密码是否一致
  static String checkDoublePassword(String doublePassword,String password){
    if(password.isEmpty){
      return '请先输入密码';
    }
    if(doublePassword.isEmpty){
      return '请确认密码';
    }

    if(doublePassword != password){
      return '两次输入密码不相同，请重新输入';
    }

    return null;
  }

  // 手机号码的验证:1开头，
  static String checkPhoneNumber(String phoneNumber){
    if(phoneNumber.isEmpty){
      return '请输入手机号码';
    }
    RegExp phoneNumberExp = new RegExp("1[3456789][0-9]{9}");
    if(!phoneNumberExp.hasMatch(phoneNumber)){
      return '手机号码不合法';
    }
    if(phoneNumber.length != 11){
      return '手机号码长度不合法';
    }
    return null;
  }

  /// 验证码
  static String checkValidateNumber(String number){
    if(number.isEmpty){
      return '请输入验证码';
    }
    if(number.length != 6){
      return '验证码不合法';
    }
    return null;
  }

  /// 检查是否为空
  static String checkNullResult(String value,String errorMsg){
    if(value.isEmpty){
      return errorMsg;
    }
    return null;
  }

  /// 检查是否为空
  static String checkNullObjectResult(var value,String errorMsg){
    try{
      if(null == value){
        return errorMsg;
      }
    }catch(e){
      return '系统异常';
    }
    return null;
  }

  /// 检查借款天数
  static String checkLoanDays(String number){
    print('借款天数：${number}');
    try{
      if(number.isEmpty){
        return '请输入具体数值';
      }else {
        if ((int.parse(number)) <= 0 || (int.parse(number) > 30)) {
          return "请输入具体天数，不得超过30";
        }
      }
    } catch(e){
      return '请输入正确的数值';
    }
    return null;
  }

  /// 检查借款金额
  static String checkLoanAmount(String loanAmount){
    print('借款金额：${loanAmount}');
    try{
      if(loanAmount.isEmpty){
        return '请输入具体数值';
      }else {
        if ((double.parse(loanAmount)) <= 0) {
          return "借款金额必须大于0";
        }
      }
    } catch(e){
      return '请输入正确的数值';
    }
    return null;
  }

  /// 检查身份证编号
  static String checkIdNo(String idNo){
    // 位数不够
    if (idNo.length != 18) {
      return "请输入正确的身份证号码";
    }
    if(null == idNo || idNo.isEmpty){
      return "请输入您的身份证号码";
    }
    RegExp regExp = new RegExp(r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$');
    if(!regExp.hasMatch(idNo)){
      return "您输入的身份证不合法";
    }
    //将前17位加权因子保存在数组里
    final List idCardList = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"];
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    final List idCardYArray = ['1','0','10','9','8','7','6','5','4','3','2'];
    // 前17位各自乖以加权因子后的总和
    int idCardWiSum = 0;

    for (int i = 0; i < 17; i ++) {
      int subStrIndex = int.parse(idNo.substring(i,i+1));
      int idCardWiIndex = int.parse(idCardList[i]);
      idCardWiSum += subStrIndex * idCardWiIndex;
    }
    // 计算出校验码所在数组的位置
    int idCardMod = idCardWiSum % 11;
    // 得到最后一位号码
    String idCardLast = idNo.substring(17,18);
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if (idCardMod == 2){
      if (idCardLast != 'x' && idCardLast != 'X'){
        return "您输入的身份证非法";
      }
    }else{
      //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
      if (idCardLast != idCardYArray[idCardMod]){
        return "您输入的身份证无效";
      }
    }
    return null;
  }

  /// 邮箱验证
  static String checkEmail(String email){
    print('checkEmail param:${email}');
    if(null == email || email.isEmpty){
      return '请填写常用邮箱';
    }
    RegExp regExp = new RegExp(r'^[A-Za-z0-9_\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$');
    if(!regExp.hasMatch(email)){
      return "您输入的邮箱不合法";
    }
    return null;
  }

  /// 银行卡号的脱敏
  static String desensitiseAccount(String accountNo){
    String result = "";
    if(null != accountNo && accountNo.isNotEmpty && accountNo.length > 0){
      if(accountNo.length <= 16){
        result = "**** **** **** " + accountNo.substring(accountNo.length - 4,accountNo.length);
      }else{
        result = "**** **** **** **** " + accountNo.substring(accountNo.length - 3,accountNo.length);
      }
    }
    return result;
  }

  /// 银行卡号的脱敏
  static String desensitisePhoneNumber(String phoneNumber){
    String result = "";
    if(null != phoneNumber && phoneNumber.isNotEmpty && phoneNumber.length > 0 ){
      return "*** **** " + phoneNumber.substring(phoneNumber.length - 4, phoneNumber.length);
    }
    return result;
  }

  /// 金额保留两位小数
  static String covertPrecision(double amount, int fractionDigits){
    String result = "";
    if(null != amount ){
      result = amount.toStringAsFixed(fractionDigits);
    }
    return result;
  }

  /// 折扣转换成百分比
  static String covertPercent(double discount,int fractionDigits){
    String result = "";
    if(null != discount ){
      result = (discount*100).toStringAsFixed(fractionDigits) + '%' ;
    }
    return result;
  }

  static String genAccountSuffix(String accountNo){
    String result = "";
    if(null != accountNo && accountNo.isNotEmpty && accountNo.length > 0){
      if(accountNo.length <= 16){
        result = accountNo.substring(accountNo.length - 4,accountNo.length);
      }else{
        result = accountNo.substring(accountNo.length - 3,accountNo.length);
      }
    }
    return result;
  }

  /// 将字符串转成double
  static double stringToDouble(String number){
    try{
      return double.parse(number);
    }catch(error){
      print('error :${error}');
      return 0;
    }
  }

  /// 将字符串转成int
  static int stringToInt(String value){
    try{
      return int.parse(value);
    }catch(error){
      print('error :${error}');
      return null;
    }
  }
}