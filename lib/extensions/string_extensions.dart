extension StringParser on String {
  String getMediaType() => split('/').last.split('.').last;

  String getMediaName() => split('/').last.split('.').first;
}
