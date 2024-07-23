import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/historical/data/models/historical_place_model.dart';

void customNavigate(context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

class HistoricalItemWithIndex {
  final HistoricalModel item;
  final int index;

  HistoricalItemWithIndex({required this.item, required this.index});
}

void customNavigateData(BuildContext context, String path,
    {required HistoricalModel historical, required int index}) {
  GoRouter.of(context).push(
    path,
    extra: {'historical': historical, 'index': index},
  );
}
