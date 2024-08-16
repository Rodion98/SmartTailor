import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/http_client.dart';
import 'package:neobis_smart_tailor/core/network/http_codes.dart';
import 'package:neobis_smart_tailor/core/network/http_paths.dart';
import 'package:neobis_smart_tailor/core/network/on_repository_exception.dart';
import 'package:neobis_smart_tailor/features/organization/pages/organization/data/data_source/organization_data_source.dart';
import 'package:neobis_smart_tailor/features/organization/pages/organization/data/models/organization_info_model/organization_info_model.dart';

@Injectable(as: OrganizationDataSource)
class OrganizationDataSourceImpl implements OrganizationDataSource {
  final HttpClient _client;

  OrganizationDataSourceImpl(
    this._client,
  );

  @override
  Future<OrganizationInfoModel?> getOrganization() async {
    try {
      final response = await _client.get(
        HttpPaths.getOrganization,
      );
      if (response.statusCode != HttpSuccess.success) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Order creation failed, status code: ${response.statusCode}',
        );
      } else {
        var list = OrganizationInfoModel.fromJson(response.data);

        return list;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return null;
      }
      // ignore: only_throw_errors
      throw handleDioException(e);
    } catch (e) {
      // ignore: only_throw_errors
      throw handleGeneralException(e);
    }
  }
}
