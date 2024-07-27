import '../error/failures.dart';
import '../utils/app_strings.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return AppStrings.EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return AppStrings.OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
