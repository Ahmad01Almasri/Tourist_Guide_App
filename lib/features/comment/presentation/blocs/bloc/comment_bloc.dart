import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';
import 'package:tourist_guide/features/comment/domain/use_cases/add_comment.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/functions/failure_bloc_message.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/get_comments_model.dart';
import '../../../domain/use_cases/get_all_comments.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllCommentUsecase? getAllComment;
  final AddCommentUsecase? addComment;

  CommentBloc({
    this.addComment,
    this.getAllComment,
  }) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      if (event is GetAllCommentEvent) {
        emit(LoadingCommentState());

        final failureOrComment = await getAllComment!();
        emit(_mapFailureOrCommentToState(failureOrComment));
      } else if (event is RefreshCommentEvent) {
        emit(LoadingCommentState());

        final failureOrComment = await getAllComment!();
        emit(_mapFailureOrCommentToState(failureOrComment));
      }
      if (event is AddCommentEvent) {
        emit(LoadingCommentState());

        final failureOrDoneMessage = await addComment!(event.comment);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, AppStrings.ADD_COMMENT_MESSAGE),
        );
      }
    });
  }

  CommentState _mapFailureOrCommentToState(
      Either<Failure, List<GetCommentsModel>> either) {
    return either.fold(
      (failure) => ErrorCommentState(message: mapFailureToMessage(failure)),
      (comments) => LoadedCommentState(
        comments: comments,
      ),
    );
  }

  CommentState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorCommentState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => SuccsessCommentState(message: message),
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
