import 'package:equatable/equatable.dart';

abstract class TableEvent extends Equatable {
  const TableEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TableFetch extends TableEvent {}


class MakeTableUninitialized extends TableEvent {}

