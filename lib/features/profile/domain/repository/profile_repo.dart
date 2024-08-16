import 'dart:io';
import 'package:neobis_smart_tailor/features/profile/domain/model/announcement_response_entity.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/equipment_detailed_entity.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/order_detailed_entity.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/profile_entity.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/service_detailed_entity.dart';

abstract class ProfileRepo {
  Future<void> signOut();
  Future<ProfileEntity> getProfileInfo();
  Future<ProfileEntity> editProfileInfo(ProfileEntity params);
  Future<void> sendSubscription();
  Future<void> uploadImage(File imageFile);
  Future<AnnouncementResponseEntity> getMyEquipments({required int pageNumber});
  Future<AnnouncementResponseEntity> getMyOrders({required int pageNumber});
  Future<AnnouncementResponseEntity> getMyServices({required int pageNumber});
  Future<OrderDetailedEntity> getOrderDetailedById({required int id});
  Future<EquipmentDetailedEntity> getEquipmentDetailedById({required int id});
  Future<ServiceDetailedEntity> getServiceDetailedById({required int id});
}
