

// Widget buildShimmerLoading(int itemCount ) {
//     return SizedBox(
//       height: 497,
//       child: ListView.builder(
//         itemCount: itemCount ?? 5, // Number of shimmer cards to show
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: AppColors.black38,
//               highlightColor: AppColors.offWhite,
//               child: Card(
//                 child: Container(
//                   height: 100.0,
//                   width: double.infinity,
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }