import 'package:equatable/equatable.dart';
import 'package:softinfosystemsproj/Models/table_model.dart';

abstract class TableState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TableUninitialized extends TableState {}




class TableLoaded extends TableState {
  final TableData tableData;

  TableLoaded({required this.tableData,});

  @override
  // TODO: implement props
  List<Object?> get props => [tableData];
}



class TableError extends TableState {}
