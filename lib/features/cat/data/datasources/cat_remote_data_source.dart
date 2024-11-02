import 'dart:convert';

import '../../../../shared/network/api_client.dart';
import '../../../../shared/resource/exceptions.dart';
import '../models/cat_fact_model.dart';

/// An abstract remote data source class for cat facts contract methods
abstract class CatRemoteDataSource {
  /// A contract method for getting cat facts
  Future<List<CatFactModel>> getCatFacts();
}

/// A remote data source class for cat facts
class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  /// An instance of [ApiClient]
  final ApiClient apiClient;

  /// Creates an instance of [CatRemoteDataSourceImpl]
  CatRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<List<CatFactModel>> getCatFacts() async {
    final response = await apiClient.get(path: '/facts');
    if (response.statusCode != 200) throw ServerException(response.body);
    final result = jsonDecode(response.body);
    return List<CatFactModel>.from(result.map((x) => CatFactModel.fromJSON(x)));
  }
}
