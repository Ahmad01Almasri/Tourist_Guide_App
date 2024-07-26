import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/features/historical/presentation/blocs/historicals_bloc.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';
import 'package:tourist_guide/features/hotel/presentation/bloc/hotel_bloc.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/card_item.dart';
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
            const TopAllItemBar(
              topText: AppStrings.hotels,
              image: AppAssets.hotelTopBar,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<HotelBloc, HotelState>(
                builder: (context, state) {
                  if (state is LoadingHotelState) {
                    print("lllllllllllllllllllllll");

                    return LoadingWidget();
                  } else if (state is LoadedHotelState) {
                    print("ssssssssssssssssssssssssssss");

                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: HotelListWidget(hotel: state.hotel));
                  } else if (state is ErrorHotelState) {
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
  BlocProvider.of<HotelBloc>(context).add(RefreshHotelEvent(getCityName()));
}
