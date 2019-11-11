import 'package:permission_handler/permission_handler.dart';
/// 访问权限的通用方法
class PermissionUtil{

  /// 根据permissionGroup 检查权限，并发起权限请求
  static Future<PermissionStatus> checkPermissionStatus(PermissionGroup permissionGroup) async{
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(permissionGroup);
    if (permission != PermissionStatus.granted && permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permissionStatus = await PermissionHandler().requestPermissions([permissionGroup]);
      return permissionStatus[permissionGroup] ?? PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  /// 多个权限发起并返回是否有未开启权限
  static Future<bool> requestPermissions(List<PermissionGroup> permissions) async{
    Map<PermissionGroup, PermissionStatus> permissionStatusMap = await PermissionHandler().requestPermissions(permissions);
    List<bool> results = permissionStatusMap.values.toList().map((status) {
      return status == PermissionStatus.granted;
    }).toList();

    return !results.contains(false);
  }

  /// 申请系统相关权限 - 单个权限请求
  static Future<bool> applyPermission(PermissionGroup permissionGroup, bool needRequest) async{
    /// 只有当用户同时点选了拒绝开启权限和不再提醒后才会true
    bool isShow = await PermissionHandler().shouldShowRequestPermissionRationale(permissionGroup);
    /// 检查权限状态
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(permissionGroup);
    if(permission != PermissionStatus.granted){
      /// 未进行授权
      if(isShow){
        /// 打开系统权限设置
        await PermissionHandler().openAppSettings();
      } else {
        /// 是否需要再次发起请求
        if(needRequest){
          /// 再次发起权限请求
          await PermissionHandler().requestPermissions([permissionGroup]);
          /// 检查权限开启状态
          permission = await PermissionHandler().checkPermissionStatus(permissionGroup);
          if(permission == PermissionStatus.granted){
            return true;
          }else{
            return false;
          }
        }
      }
    } else {
      return true;
    }
  }

}



