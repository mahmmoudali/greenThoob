import 'package:ojos_app/core/entities/base_entity.dart';

class UserAddressEntity extends BaseEntity {
  final int? id;
  final String? description;
  final String? address;
  final double? latitude;
  final double? longitude;
  final bool? is_default;
  final int? user_id;

  UserAddressEntity({
    required this.id,
    required this.user_id,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.description,
    required this.is_default,
  });

  @override
  List<Object> get props => [
        id ?? 0,
        user_id ?? 0,
        address ?? '',
        longitude ?? 0.0,
        latitude ?? 0.0,
        description ?? '',
        is_default ?? false,
      ];
}
