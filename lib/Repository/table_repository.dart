import 'package:dio/dio.dart';

class TableRepository {
  final Dio _dio = Dio();


  Future getTableData({required String url}) async {
    final response = await _dio.get(url
    );
    return response;
  }

}
