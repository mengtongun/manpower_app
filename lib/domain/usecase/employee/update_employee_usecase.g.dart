// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_employee_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmployeeParams _$UpdateEmployeeParamsFromJson(
        Map<String, dynamic> json) =>
    UpdateEmployeeParams(
      manpowerId: json['manpowerId'] as String?,
      designation: json['designation'] as String?,
      project: json['project'] as String?,
      team: json['team'] as String?,
      supervisor: json['supervisor'] as String?,
      joinDate: json['joinDate'] as String?,
      resignDate: json['resignDate'] as String?,
    )
      ..nric4Digit = json['nric4Digit'] as String?
      ..name = json['name'] as String?;

Map<String, dynamic> _$UpdateEmployeeParamsToJson(
        UpdateEmployeeParams instance) =>
    <String, dynamic>{
      'nric4Digit': instance.nric4Digit,
      'name': instance.name,
      'manpowerId': instance.manpowerId,
      'designation': instance.designation,
      'project': instance.project,
      'team': instance.team,
      'supervisor': instance.supervisor,
      'joinDate': instance.joinDate,
      'resignDate': instance.resignDate,
    };
