import 'package:flutter/material.dart';
import 'package:softinfosystemsproj/Models/table_model.dart';

import 'table_cell.dart';

class TableHead extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> entryItems;
double cellHeight=50;
  TableHead({
    required this.scrollController,
    required this.entryItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cellHeight,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: TableDataCell(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              value: "Entries",
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(entryItems.length, (index) {
                return TableDataCell(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  value: entryItems[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
