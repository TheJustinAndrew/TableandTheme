import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softinfosystemsproj/Bloc/table_event.dart';
import 'package:softinfosystemsproj/Bloc/table_state.dart';
import 'package:softinfosystemsproj/Models/table_model.dart';
import 'package:softinfosystemsproj/Repository/table_repository.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc(TableState initialState) : super(initialState);

  final String tableDataUrl = "https://api.publicapis.org/entries";

  TableRepository tableRepository = TableRepository();

  @override
  Stream<TableState> mapEventToState(TableEvent event) async* {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // TODO: implement mapEventToState
    // throw UnimplementedError();
    final currentState = state;
    if (event is MakeTableUninitialized) {
      yield TableUninitialized();
    }
    if (event is TableFetch) {
      try {
        final response = await tableRepository.getTableData(url: tableDataUrl);
        TableData tableData = TableData.fromJson(response.data);
        yield TableLoaded(tableData: tableData);
      } catch (e) {
        yield TableError();
      }
    }
  }
}
