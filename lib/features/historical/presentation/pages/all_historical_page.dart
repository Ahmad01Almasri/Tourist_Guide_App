import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/features/historical/presentation/blocs/historicals_bloc.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../../../../core/widgets/top_all_item.dart';
import '../widgets/historical_list_widget.dart';

class AllHistoricalPage extends StatelessWidget {
  AllHistoricalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopAllItemBar(
              image: AppAssets.historicalTopBar,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<HistoricalBloc, HistoricalState>(
                builder: (context, state) {
                  if (state is LoadingHistoricalState) {
                    print("lllllllllllllllllllllll");

                    return LoadingWidget();
                  } else if (state is LoadedHistoricalsState) {
                    print("ssssssssssssssssssssssssssss");

                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: HistoricalListWidget(
                            historical: state.historicals));
                  } else if (state is ErrorHistoricalState) {
                    print("eeeeeeeeeeeeeeeeeeeeeeee");

                    return MessageDisplayWidget(message: state.message);
                  }
                  print("wwwwwwwwwwwwwwwwwwwwww");
                  return LoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _onRefresh(BuildContext context) async {
  BlocProvider.of<HistoricalBloc>(context)
      .add(RefreshHistoricalsEvent(getCityName()));
}
