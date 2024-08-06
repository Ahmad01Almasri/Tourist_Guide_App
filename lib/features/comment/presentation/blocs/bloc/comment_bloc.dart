import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';
import 'package:tourist_guide/features/comment/domain/use_cases/add_comment.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/functions/failure_bloc_message.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/get_comments_model.dart';
import '../../../domain/use_cases/delet_comment.dart';
import '../../../domain/use_cases/get_all_comments.dart';
import '../../../domain/use_cases/update_comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllCommentUsecase? getAllComment;
  final AddCommentUsecase? addComment;
  final DeleteCommentUsecase? deleteComment;
  final UpdateCommentUsecase? updateComment;
  CommentBloc({
    this.addComment,
    this.getAllComment,
    this.deleteComment,
    this.updateComment,
  }) : super(CommentInitial()) {
    on<GetAllCommentEvent>(_onGetAllCommentEvent);
    on<RefreshCommentEvent>(_onRefreshCommentEvent);
    on<AddCommentEvent>(_onAddCommentEvent);
    on<DeleteCommentEvent>(_onDeleteCommentEvent);
    on<UpdateCommentEvent>(_onUpdateCommentEvent);
  }

  Future<void> _onGetAllCommentEvent(
      GetAllCommentEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentState());

    final failureOrComment = await getAllComment!();
    emit(_mapFailureOrCommentToState(failureOrComment));
  }

  Future<void> _onRefreshCommentEvent(
      RefreshCommentEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentState());

    final failureOrComment = await getAllComment!();
    emit(_mapFailureOrCommentToState(failureOrComment));
  }

  Future<void> _onAddCommentEvent(
      AddCommentEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentState());

    final failureOrDoneMessage = await addComment!(event.comment);

    emit(
      _eitherDoneMessageOrErrorState(
          failureOrDoneMessage, AppStrings.ADD_COMMENT_MESSAGE),
    );
  }

  Future<void> _onDeleteCommentEvent(
      DeleteCommentEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentState());

    final failureOrDoneMessage = await deleteComment!(event.commentId);

    failureOrDoneMessage.fold(
      (_) {
        emit(SuccessCommentState(message: AppStrings.DELETE_SUCCESS_MESSAGE));
      },
      (failure) {
        emit(SuccessCommentState(message: AppStrings.DELETE_SUCCESS_MESSAGE));
      },
    );
  }

  Future<void> _onUpdateCommentEvent(
      UpdateCommentEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentState());

    try {
      final result = await updateComment!(event.newText, event.id);
      emit(SuccessCommentState(message: AppStrings.UPDATE_SUCCESS_MESSAGE));
    } catch (e) {
      emit(ErrorCommentState(message: AppStrings.UPDATE_SUCCESS_MESSAGE));
    }
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
      (_) => SuccessCommentState(message: message),
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
