import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle{
  /// -------------- 通用style -------------------------
  /// 字体大小
  static const text_48 = 48;
  static const text_40 = 40;
  static const text_36 = 36;
  static const text_30 = 30;
  static const text_28 = 28;
  static const text_24 = 24;
  static const text_20 = 20;
  static const text_18 = 18;

  /// 颜色 0x 后面开始 两位FF表示透明度16进制，之后的FFFFFF 代表RGB色值
  /// 按钮渐变色
  static const color_gradient_right = 0xFF141414;
  static const color_gradient_left = 0xFF414141;

  /// 主要颜色
  static const color_black_00 = 0xFF000000;
  static const color_black_01 = 0xFF010101;
  static const color_black_21 = 0xFF212121;
  static const color_black_33 = 0xFF333333;
  static const color_grey = 0xFF999999;
  static const color_grey_f0 = 0xFFf0f0f0;
  static const color_grey_66 = 0xFF666666;
  static const color_grey_dd =0xFFDDDDDD;
  static const color_red_45 = 0xFFFF4545;
  static const color_yellow_f8 = 0xFFF8D45B;
  static const color_white = 0xFFFFFFFF;


  /// 提示颜色
  static const color_err_msg = 0xFFd94949;

  /// 间距
  static const mp_60 = 60;
  static const mp_30 = 30;
  static const mp_20 = 20;
  static const mp_10 = 10;
  static const mp_5 = 5;

  /// offset 偏移量
  static const offset_0 = 0.0;

  ///radius 弧度
  static const radius_25 = 25.0;
  static const radius_15 = 15.0;
  static const radius_10 = 10.0;
  static const radius_5 = 5.0;

  /// 高度
  static const blankHeight = 30;
  static const textHeight = 80;

  /// Picker相关
  static const pickerHeight = 400;
  static const pickerItemExtent = 90;

  /// loading size
  static const spinKitFadingCircleSize = 50.0;

  /// slider-button
  static const sliderButtonWidth = 100;

  /// icon
  static const icon_width_60 = 60;
  static const icon_height_60 = 60;

  static const icon_width_50 = 50;
  static const icon_height_50 = 50;


  /// ------------------------- 首页 -------------------------
  /// 首页tip的内容
  static const homeTipImgWidth = 90;
  static const homeLoanImgWidth = 60;

  static const recommendImgWidth = 200;
  static const recommendProductWidth = 80;
  static const recommendProductRadius = 5.0;
  static const recommendProductColor = 0xFFec6f64;

  /// 额度授权
  static const authTipImgWidth = 20;
  static const idCardPhotoRadius = 5.0;
  static const cameraImgWidth = 40;
  static const cameraImgMarginWidth = 30;

  /// ------------------------- 银行卡 -------------------------
  static const bankCardPositionLeft = 30.0;
  static const bankCardPositionTop = 53.0;
  static const bankPickerLogoImgWidth = 50;


  /// ------------------------- 个人中心 -------------------------
  static const user_banner_height = 330;
  static const user_banner_bottom_height = 150;
  static const user_avatar_width = 120;
  static const user_avatar_margin_top = 20;
  static const user_banner_setting_margin_top = 10;
  /// 控制 白色区域举例顶端的高度
  static const user_content_top = 220;

  static const contentImgWidth = 5;
  static const personalHeadImageWidth = 60;
  static const personalHeadImageRadius = 25.0;

  static const myBillEmptyImgWidth = 60;
  /// ffeff0        fffbfa      f3f3f3       f7f7f7
  static const couponEffectiveLeftColor = 0xFFffeff0;
  static const couponEffectiveRightColor = 0xFFfffbfa;
  static const couponInvalidLeftColor = 0xFFf3f3f3;
  static const couponInvalidRightColor = 0xFFf7f7f7;
  static const couponHeightScale = 0.13;
  static const couponUpHeightScale = 0.6;
  static const couponDownHeightScale = 0.2;

  static const feedbackMaxLength = 500;
  static const feedbackMaxLines = 15;


}