import 'package:intl/intl.dart';

class AppConstant {
  static String defaultImage =
      "http://biz-oss-dev.miaogoche.cn/zulin/bizImage/F_FC15302410810000000017_GPS_O_15638127740000000741_0.png?Expires=4719486397&OSSAccessKeyId=LTAIFVdn88UX5oys&Signature=TB6sctRhQnUltL1qy6tOPEbvavE%3D";

  static const zero = 0;

  /// 验证码倒计时
  static const countdownMaxTime = 60;

  /// 验证标识
  static const sendMsgCodeFlagByPhone = "1";
  static const sendMsgCodeFlagByEmail = "2";
  static const sendMsgCodeFlagByAccount = "3";

  /// 日期的格式
  static final dateFormat = DateFormat("yyyy-MM-dd");

  /// 银行卡LOGO前缀
  static final bankLogoPrefix =
      "https://public-zulin.oss-cn-beijing.aliyuncs.com/credit/bank/BANK_LOGO_";
  static final bankLogoSuffix = ".png";

  static final bankBriefLogoPrefix =
      "https://public-zulin.oss-cn-beijing.aliyuncs.com/credit/bank/BANK_BRIEF_LOGO_";
  static final bankBriefLogoSuffix = ".png";

  static final bracePrefix = "（";
  static final braceSuffix = "）";

  /// 连接符
  static final couponEffectiveDate = "有效期至：";

  /// 默认还款方式 - 按月还款
  static final defaultRepayFrequency = "4";
  static final dayRepayFrequency = "3";

  /// 银行卡类型
  static final accountType_cash = "1";

  /// 是否
  static const Y = "Y";
  static const N = "N";

  /// 客服电话
  static const companyPhone = "tel:18621841989";

  /// 联系人标识 E-紧急联系人；C-常用联系人
  static const relationTypeE = "E";
  static const relationTypeC = "C";

  /// 修改个人信息的flag标识
  static const setAvatar = "1";
  static const setNickName = "2";
  static const setGender = "3";

  /// 时间延迟
  static const defaultDurationSecond = 1;

  /// 密码检查flag
  static const checkPasswordFlag = "1";
  static const checkDoublePasswordFlag = "2";

  /// 区分是从注册进入还是从忘记密码进入
  static const checkRegisterFlag = "1";

  /// 首页默认产品代码
  static const productCode = "productCode";
  static const loanPeriod = "loanPeriod";

  /// 分页查询的默认值
  static const defaultPageSize = 10;
  static const defaultPageNum = 1;
  static const sortDesc = 'DESC';
  static const sortAsc = 'ASC';

  /// 系统通知的状态
  static const noticeStatus_1 = "1";
  static const noticeStatus_2 = "2";

  /// 活动状态
  static const activityStatus_1 = "1";

  /// 文件代码
  static const idCardFrontFileCode = "FC0000000001";
  static const idCardBackFileCode = "FC0000000002";
  static const avatorFile = 'AVATOR';
}
