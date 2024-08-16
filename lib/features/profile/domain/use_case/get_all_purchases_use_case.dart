import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/use_case/use_case.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/my_purchases.dart';
import 'package:neobis_smart_tailor/features/profile/domain/repository/profile_repo.dart';

@singleton
class GetAllPurchasesUseCase extends UseCase<PurchasesListEntity, int> {
  final ProfileRepo repo;

  GetAllPurchasesUseCase({required this.repo});

  @override
  Future<PurchasesListEntity> call(int params) async {
    var entity = await repo.getAllPurchases(pageNumber: params);
    return entity;
  }
}