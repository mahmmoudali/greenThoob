// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) {
  return NotificationsModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      notifiable_id: json['notifiable_id'],
      id: json['id'] as String?,
      type: json['type'] as int?,
      type_int: json['type_int'] as int?);
}

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'notifiable_id': instance.notifiable_id,
      'title': instance.title,
      'id': instance.id,
      'type': instance.type,
      'type_int': instance.type_int
    };
