import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/http_client.dart';
import 'package:neobis_smart_tailor/core/network/http_codes.dart';
import 'package:neobis_smart_tailor/core/network/http_paths.dart';
import 'package:neobis_smart_tailor/core/network/on_repository_exception.dart';
import 'package:neobis_smart_tailor/features/organization/pages/current_order/data/data_source/current_order_data_source.dart';
import 'package:neobis_smart_tailor/features/organization/pages/current_order/data/models/_model/current_order_model.dart';
import 'package:neobis_smart_tailor/features/organization/pages/current_order/data/models/organization_list_model/organization_list_model.dart';

@Injectable(as: CurrentOrderDataSource)
class CurrentOrderDataSourceImpl implements CurrentOrderDataSource {
  final HttpClient _client;

  CurrentOrderDataSourceImpl(this._client);

  @override
  Future<OrganizationListModel> gatAllOrders() async {
    try {
      final response = await _client
          .get(HttpPaths.getAllCurrentOrders, queryParameters: {'pageNumber': 0, 'pageSize': 10, 'stage': 'current'});
      if (response.statusCode != HttpSuccess.success) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Order creation failed, status code: ${response.statusCode}',
        );
      } else {
        var responseJson = response.data;
        print(responseJson);
        // var models = list.map((json) => CurrentOrderModel.fromJson(json)).toList();
        var model = OrganizationListModel.fromJson(responseJson);
        print(model);
        return model;
      }
    } on DioException catch (e) {
      // ignore: only_throw_errors
      throw handleDioException(e);
    } catch (e) {
      // ignore: only_throw_errors
      throw handleGeneralException(e);
    }
  }

  @override
  Future<CurrentOrderModel> getDetailOrder() async {
    try {
      final response = await _client.get(
        HttpPaths.getAllCurrentOrders,
      );
      if (response.statusCode != HttpSuccess.success) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Order creation failed, status code: ${response.statusCode}',
        );
      } else {
        List<dynamic> list = response.data;
        var models = list.map((json) => CurrentOrderModel.fromJson(json)).toList();
        print(models);
        return CurrentOrderModel.initial();
      }
    } on DioException catch (e) {
      // ignore: only_throw_errors
      throw handleDioException(e);
    } catch (e) {
      // ignore: only_throw_errors
      throw handleGeneralException(e);
    }
  }

  @override
  Future<void> changeOrderStatus({required int id, required String value}) async {
    try {
      final response = await _client.put(
        '${HttpPaths.changeOrderStatus}/$id/$value',
      );
      if (response.statusCode != HttpSuccess.success) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Failed, status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // ignore: only_throw_errors
      throw handleDioException(e);
    } catch (e) {
      // ignore: only_throw_errors
      throw handleGeneralException(e);
    }
  }
}
