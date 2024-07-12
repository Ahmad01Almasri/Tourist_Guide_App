class AllHotelModel {
  final String itemName;
  final String itemModern;
  final double itemRate;
  final String itemLocation;
  final String itemImage;
  bool isFavorite;

  AllHotelModel(
      {required this.itemName,
      required this.itemModern,
      required this.itemRate,
      required this.itemLocation,
      required this.itemImage,
      required this.isFavorite});
}
