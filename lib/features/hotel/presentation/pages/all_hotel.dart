import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import 'package:tourist_guide/features/hotel/presentation/bloc/hotel_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../../../../core/widgets/top_all_item.dart';
import '../widgets/list_hotel.dart';

class AllHotelPage extends StatelessWidget {
  AllHotelPage({super.key});

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
                    return const HotelListWidget(isLoading: true);
                  } else if (state is LoadedHotelState) {
                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: HotelListWidget(
                          hotel: state.hotel,
                          isLoading: false,
                        ));
                  } else if (state is ErrorHotelState) {
                    return MessageDisplayWidget(
                      message: state.message,
                      onPressed: () => _onRefresh(context),
                    );
                  }
                  return const HotelListWidget(isLoading: true);
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
