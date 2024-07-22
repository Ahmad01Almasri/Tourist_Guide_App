import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/features/auth/domain/entities/user.dart';
import 'package:tourist_guide/features/auth/domain/use_cases/login_usecase.dart';
import 'package:tourist_guide/features/auth/domain/use_cases/signup_usecase.dart';

import '../../../../core/error/failures.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SignUpUserUsecase signUpUser;
  final LoginUserUsecase loginUser;
  UserBloc({required this.signUpUser, required this.loginUser})
      : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is SignUpUserEvent) {
        emit(LoadingUserState());

        final failureOrDoneMessage = await signUpUser(event.user);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, AppStrings.ADD_SUCCESS_MESSAGE),
        );
      }

      if (event is LoginUserEvent) {
        emit(LoadingUserState());

        final failureOrDoneMessage = await loginUser(event.user2);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, AppStrings.ADD_SUCCESS_MESSAGE),
        );
      }
    });
  }

  UserState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorUserState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => SuccsessUserState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
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
}
