/// 时间的通用的方法
class DateUtil {
  /// 年-月-日
  static const YMD = "yyyy-MM-dd";

  /// 年-月-日 时:分:秒
  static const YMDHMS = "yyyy-MM-dd hh:mm:ss";

  /// 将日期格式化成字符串样式
  static String format(DateTime date, String pattern) {
    try {
      if (null == pattern) {
        return null;
      }

      String year = date.year.toString();
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      String hour = date.hour.toString().padLeft(2, '0');
      String minute = date.minute.toString().padLeft(2, '0');
      String second = date.second.toString().padLeft(2, '0');

      if (YMD == pattern) {
        return year + '-' + month + '-' + day;
      } else if (YMDHMS == pattern) {
        return year +
            '-' +
            month +
            '-' +
            day +
            ' ' +
            hour +
            ':' +
            minute +
            ':' +
            second;
      } else {
        return year + '-' + month + '-' + day;
      }
    } catch (error) {
      return null;
    }
  }

  /// 阿里云中需要的样式
  static String toZString(DateTime date){
    try {

      String year = date.year.toString();
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      String hour = date.hour.toString().padLeft(2, '0');
      String minute = date.minute.toString().padLeft(2, '0');
      String second = date.second.toString().padLeft(2, '0');
      return year + '-' + month + '-' + day + 'T12:00:00.000Z';
    } catch (error) {
      return null;
    }
  }

}
