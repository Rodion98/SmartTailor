// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
// import 'package:neobis_smart_tailor/core/network/http_client.dart';
// import 'package:neobis_smart_tailor/core/network/http_codes.dart';
// import 'package:neobis_smart_tailor/core/network/http_paths.dart';
// import 'package:neobis_smart_tailor/core/network/on_repository_exception.dart';
// import 'package:neobis_smart_tailor/core/services/auth_service.dart';
// import 'package:neobis_smart_tailor/features/organization/data/data_source/organization_data_source.dart';

// @Injectable(as: OrganizationDataSource)
// class OrganizationDataSourceImpl implements OrganizationDataSource {
//   final HttpClient _client;
//   final AuthService service;

//   OrganizationDataSourceImpl(this._client, this.service);

//   @override
//   Future<void> getProfile() async {
//     try {
//       final response = await _client.get(
//         HttpPaths.getOrganization,
//       );
//       if (response.statusCode != HttpSuccess.success) {
//         // ignore: only_throw_errors
//         throw Failure.request(
//           status: response.statusCode,
//           message: 'Order creation failed, status code: ${response.statusCode}',
//         );
//       }
//     } on DioException catch (e) {
//       // ignore: only_throw_errors
//       throw handleDioException(e);
//     } catch (e) {
//       // ignore: only_throw_errors
//       throw handleGeneralException(e);
//     }
//   }
// }
