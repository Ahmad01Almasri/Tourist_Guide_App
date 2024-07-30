import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../../../../core/widgets/top_all_item.dart';
import '../bloc/restaurant_bloc.dart';
import '../widgets/list_res_card.dart';

class TopThreeRestaurantPage extends StatelessWidget {
  const TopThreeRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopAllItemBar(
              iconAndTextColor: AppColors.white,
              // topText: AppStrings.restaurants,
              image: "assets/images/download(2).jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  if (state is LoadingRestaurantState) {
                    return const LoadingWidget();
                  } else if (state is LoadedRestaurantState) {
                    return RefreshIndicator(
                        onRefresh: () => _onRefresh(context),
                        child: RestaurantListWidget(
                            itemCount: 3, restaurant: state.restaurant));
                  } else if (state is ErrorRestaurantState) {
                    return MessageDisplayWidget(
                        message: state.message,
                        onPressed: () => _onRefresh(context));
                  }
                  return const LoadingWidget();
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
  BlocProvider.of<RestaurantBloc>(context)
      .add(RefreshRestaurantEvent(getCityName()));
}
