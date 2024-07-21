import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/features/registration/data/data_source/registration_data_source.dart';
import 'package:neobis_smart_tailor/features/registration/data/models/registration_model/registration_model.dart';
import 'package:neobis_smart_tailor/features/registration/domain/repository/registration_repo.dart';

@Injectable(as: RegistrationRepo)
class RegistrationRepoImpl implements RegistrationRepo {
  final RegistrationDataSource _dataSource;

  RegistrationRepoImpl(
    this._dataSource,
  );

  @override
  Future<void> registration(RegistrationModel? registrationModel) async {
    await _dataSource.registration(registrationModel: registrationModel);
  }
}
