import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/features/historical/presentation/blocs/historicals_bloc.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';
import 'package:tourist_guide/features/hotel/presentation/bloc/hotel_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/card_item.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../../../../core/widgets/top_all_item.dart';
import '../widgets/list_hotel.dart';

class TopThreeHotelPage extends StatelessWidget {
  TopThreeHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopAllItemBar(
              iconAndTextColor: AppColors.white,
              image: AppAssets.hotelTopBar,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<HotelBloc, HotelState>(
                builder: (context, state) {
                  if (state is LoadingHotelState) {
                    return LoadingWidget();
                  } else if (state is LoadedHotelState) {
                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child:
                            HotelListWidget(itemCount: 3, hotel: state.hotel));
                  } else if (state is ErrorHotelState) {
                    return MessageDisplayWidget(
                      message: state.message,
                      onPressed: () => _onRefresh(context),
                    );
                  }
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
  BlocProvider.of<HotelBloc>(context).add(RefreshHotelEvent(getCityName()));
}
