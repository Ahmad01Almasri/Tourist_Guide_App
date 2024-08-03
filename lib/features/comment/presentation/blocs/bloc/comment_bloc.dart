import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/functions/failure_bloc_message.dart';
import '../../../data/models/comment_model.dart';
import '../../../domain/use_cases/get_all_comments.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllCommentUsecase? getAllComment;

  CommentBloc({
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
    });
  }

  CommentState _mapFailureOrCommentToState(
      Either<Failure, List<CommentModel>> either) {
    return either.fold(
      (failure) => ErrorCommentState(message: mapFailureToMessage(failure)),
      (comments) => LoadedCommentState(
        comments: comments,
      ),
    );
  }
}
