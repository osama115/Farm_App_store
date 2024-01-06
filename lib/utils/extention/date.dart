import 'package:vegitable_app_test1/presentation/values_manager.dart';

extension DeliveryDate on DateTime{
  static const List<String> _monthAbbreviations =[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  String get formateDate{
    return "${_monthAbbreviations[month - AppSize.si1]}$day ,$year ";
  }
}