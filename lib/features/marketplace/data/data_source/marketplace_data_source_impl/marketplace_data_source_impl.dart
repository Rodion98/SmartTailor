import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/http_client.dart';
import 'package:neobis_smart_tailor/core/network/http_paths.dart';
import 'package:neobis_smart_tailor/core/network/on_repository_exception.dart';
import 'package:neobis_smart_tailor/features/marketplace/data/data_source/marketplace_data_source.dart';
import 'package:neobis_smart_tailor/features/marketplace/data/models/general_model/general_model.dart';

@Injectable(as: MarketplaceDataSource)
// class MarketplaceDataSourceImpl implements MarketplaceDataSource {
//   final HttpClient _client;

//   MarketplaceDataSourceImpl(
//     this._client,
//   );

//   @override
//   Future<List<GeneralOrderModel>> getEquipments() async {
//     try {
//       final response = await _client.get(
//         HttpPaths.getEquipments,
//         queryParameters: {
//           'pageNumber': '0',
//           'pageSize': '2000',
//         },
//       );

//       if (response.statusCode != 200) {
//         // ignore: only_throw_errors
//         throw Failure.request(
//           status: response.statusCode,
//           message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
//         );
//       } else {
//         var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
//         print(list);
//         return list;
//       }
//     } on DioException catch (e) {
//       // ignore: only_throw_errors
//       throw handleDioException(e);
//     } catch (e) {
//       // ignore: only_throw_errors
//       throw handleGeneralException(e);
//     }
//   }

//   @override
//   Future<List<GeneralOrderModel>> getOrders() async {
//     try {
//       final response = await _client.get(
//         HttpPaths.getOrders,
//         queryParameters: {
//           'pageNumber': '0',
//           'pageSize': '2000',
//         },
//       );

//       if (response.statusCode != 200) {
//         // ignore: only_throw_errors
//         throw Failure.request(
//           status: response.statusCode,
//           message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
//         );
//       } else {
//         var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
//         print(list);
//         return list;
//       }
//     } on DioException catch (e) {
//       // ignore: only_throw_errors
//       throw handleDioException(e);
//     } catch (e) {
//       // ignore: only_throw_errors
//       throw handleGeneralException(e);
//     }
//   }

//   @override
//   Future<List<GeneralOrderModel>> getServices() async {
//     try {
//       final response = await _client.get(
//         HttpPaths.getService,
//         queryParameters: {
//           'pageNumber': '0',
//           'pageSize': '2000',
//         },
//       );

//       if (response.statusCode != 200) {
//         // ignore: only_throw_errors
//         throw Failure.request(
//           status: response.statusCode,
//           message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
//         );
//       } else {
//         // print(response.data);
//         var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
//         print(list);
//         return list;
//       }
//     } on DioException catch (e) {
//       // ignore: only_throw_errors
//       throw handleDioException(e);
//     } catch (e) {
//       // ignore: only_throw_errors
//       throw handleGeneralException(e);
//     }
//   }
// }class MarketplaceDataSourceImpl implements MarketplaceDataSource {
@Injectable(as: MarketplaceDataSource)
class MarketplaceDataSourceImpl implements MarketplaceDataSource {
  final HttpClient _client;

  MarketplaceDataSourceImpl(this._client);

  @override
  Future<List<GeneralOrderModel>> getEquipments({required int pageNumber}) async {
    try {
      final response = await _client.get(
        HttpPaths.getEquipments,
        queryParameters: {
          'pageNumber': pageNumber.toString(),
          'pageSize': '10',
        },
      );

      if (response.statusCode != 200) {
        throw Failure.request(
          status: response.statusCode,
          message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
        );
      } else {
        var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
        return list;
      }
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw handleGeneralException(e);
    }
  }

  @override
  Future<List<GeneralOrderModel>> getOrders({required int pageNumber}) async {
    try {
      final response = await _client.get(
        HttpPaths.getOrders,
        queryParameters: {
          'pageNumber': pageNumber.toString(),
          'pageSize': '10',
        },
      );

      if (response.statusCode != 200) {
        throw Failure.request(
          status: response.statusCode,
          message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
        );
      } else {
        var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
        return list;
      }
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw handleGeneralException(e);
    }
  }

  @override
  Future<List<GeneralOrderModel>> getServices({required int pageNumber}) async {
    try {
      final response = await _client.get(
        HttpPaths.getService,
        queryParameters: {
          'pageNumber': pageNumber.toString(),
          'pageSize': '10',
        },
      );

      if (response.statusCode != 200) {
        throw Failure.request(
          status: response.statusCode,
          message: 'Неудалось загрузить, код ошибки: ${response.statusCode}',
        );
      } else {
        var list = (response.data as List).map((model) => GeneralOrderModel.fromJson(model)).toList();
        return list;
      }
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw handleGeneralException(e);
    }
  }
}