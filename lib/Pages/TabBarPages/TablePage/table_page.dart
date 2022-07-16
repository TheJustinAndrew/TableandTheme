import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:softinfosystemsproj/Bloc/table_bloc.dart';
import 'package:softinfosystemsproj/Bloc/table_event.dart';
import 'package:softinfosystemsproj/Bloc/table_state.dart';
import 'package:softinfosystemsproj/Pages/TabBarPages/TablePage/table_body.dart';
import 'package:softinfosystemsproj/Pages/TabBarPages/TablePage/table_head.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TableBloc tableBloc = TableBloc(TableUninitialized());
  late LinkedScrollControllerGroup controllers;

  late ScrollController headController;
  late ScrollController bodyController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers = LinkedScrollControllerGroup();
    headController = controllers.addAndGet();
    bodyController = controllers.addAndGet();
    retrieveData();
  }

  @override
  void dispose() {
    headController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  retrieveData() {
    tableBloc.add(MakeTableUninitialized());
    tableBloc.add(TableFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          retrieveData();
        },
        child: const Icon(Icons.refresh),
      ),
      body: BlocProvider<TableBloc>(
        create: (BuildContext context) {
          return tableBloc;
        },
        child: BlocListener<TableBloc, TableState>(
          bloc: tableBloc,
          listener: (context, state) {},
          child: BlocBuilder<TableBloc, TableState>(builder: (context, state) {
            if (state is TableUninitialized) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TableError) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      retrieveData();
                    },
                    child: const Text("Retry")),
              );
            }
            if (state is TableLoaded) {
              return Column(
                children: [
                  TableHead(
                    scrollController: headController,
                    entryItems: state.tableData.entryItems,
                  ),
                  Expanded(
                    child: TableBody(
                      entryData: state.tableData.entryItems,
                      entries: state.tableData.entries,
                      scrollController: bodyController,
                    ),
                  ),
                ],
              );
            }

            return Container();
          }),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
