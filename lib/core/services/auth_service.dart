import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/auth_info.dart';
import 'package:neobis_smart_tailor/core/services/secure_storage_service.dart';
import 'package:neobis_smart_tailor/injection/injection.dart';

@singleton
class AuthService {
  AuthData? _cachedUser;
  String? _cachedAppleID;

  AuthData? get cachedUser => _cachedUser;

  String? get cachedAppleID => _cachedAppleID;

  set cachedUser(AuthData? info) {
    _cachedUser = info;
    print(info!.accessToken);
    print(info.username);
    print(info.refreshToken);
    if (_cachedUser != null) {
      getIt<SecureStorageService>().setUser(_cachedUser!);
    }
  }

  Future<void> recoverUser() async {
    _cachedUser = await getIt<SecureStorageService>().getUser();
  }

  Future<void> signOut() async {
    await getIt<SecureStorageService>().wipeStorage();
    _cachedUser = null;
  }
}
