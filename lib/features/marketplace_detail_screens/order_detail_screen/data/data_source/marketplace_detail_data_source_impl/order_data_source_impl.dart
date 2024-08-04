import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/http_client.dart';
import 'package:neobis_smart_tailor/core/network/http_paths.dart';
import 'package:neobis_smart_tailor/core/network/on_repository_exception.dart';
import 'package:neobis_smart_tailor/features/marketplace_detail_screens/order_detail_screen/data/data_source/order_detail_data_source.dart';
import 'package:neobis_smart_tailor/features/marketplace_detail_screens/order_detail_screen/data/models/order_detail_model/order_detail_model.dart';

@Injectable(as: OrderDetailDataSource)
class OrderDetailDataSourceImpl implements OrderDetailDataSource {
  final HttpClient _client;

  OrderDetailDataSourceImpl(
    this._client,
  );

  @override
  Future<OrderDetailModel> getDetailOrder({int? id}) async {
    try {
      final response = await _client.get(
        HttpPaths.getOrderById + id.toString(),
      );

      if (response.statusCode != 200) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
        );
      } else {
        var model = OrderDetailModel.fromJson(response.data);
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
  Future<void> requestToExecute({int? id}) async {
    try {
      final response = await _client.post(
        HttpPaths.postRequestToExecute + id.toString(),
      );

      if (response.statusCode != 200) {
        // ignore: only_throw_errors
        throw Failure.request(
          status: response.statusCode,
          message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
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