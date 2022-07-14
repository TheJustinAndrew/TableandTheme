import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:softinfosystemsproj/Bloc/table_bloc.dart';
import 'package:softinfosystemsproj/Bloc/table_event.dart';
import 'package:softinfosystemsproj/Bloc/table_state.dart';
import 'package:softinfosystemsproj/Models/table_model.dart';

import 'table_cell.dart';

class TableBody extends StatefulWidget {
  final ScrollController scrollController;
  final List<String> entryData;
  final List<Entries> entries;

  TableBody(
      {required this.scrollController,
      required this.entries,
      required this.entryData});

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;
  TableBloc tableBloc = TableBloc(TableUninitialized());
  double height = 100;
  double width = 120;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: ListView(
            controller: _firstColumnController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: List.generate(widget.entries.length, (index) {
              return TableDataCell(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                value: (index + 1).toString(),
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: (widget.entryData.length) * width,
              child: ListView(
                controller: _restColumnsController,
                physics: const ClampingScrollPhysics(),
                children: List.generate(widget.entries.length, (y) {
                  return Row(children: [
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].aPI,
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].description,
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].auth,
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].hTTPS.toString(),
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].cors,
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].link,
                    ),
                    TableDataCell(
                      color: Colors.transparent,
                      value: widget.entries[y].category,
                    ),
                  ]);
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
