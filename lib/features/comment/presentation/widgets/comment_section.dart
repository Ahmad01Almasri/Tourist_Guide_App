import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/functions/save_place_id.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/core/widgets/loading_widget.dart';

import '../../domain/entities/comment_entiti.dart';
import '../blocs/bloc/comment_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/snackbar_message.dart';
import 'package:tourist_guide/injection_container.dart' as di;

class CommentSection extends StatefulWidget {
  const CommentSection({
    super.key,
  });

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final commentTextController = TextEditingController();
  late final CommentBloc _bloc;
  @override
  void initState() {
    _bloc = di.sl<CommentBloc>();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    commentTextController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formstate,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomTextForm(
                          validator: (text) {
                            if (text!.isEmpty) {
                              return AppStrings.empty;
                            }
                            return null;
                          },
                          hinttext: AppStrings.writeSomethingHere,
                          mycontroller: commentTextController,
                          obscureText: false)),
                  IconButton(
                      iconSize: 35,
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          final comment = Comment(
                              placeID: getPlaceId(),
                              commentText: commentTextController.text);
                          _bloc.add(AddCommentEvent(comment: comment));
                        }
                      },
                      icon: Icon(
                        Icons.arrow_circle_up,
                        color: AppColors.black,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  height: 40,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  color: AppColors.primaryColor,
                  onPressed: () {
                    commentTextController.clear();

                    customNavigate(context, AppNamePage.commentsPage);
                  },
                  child: Text(
                    AppStrings.viewComments,
                    style: AppTextStyles.poppinsBoldstyle18
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
              BlocConsumer<CommentBloc, CommentState>(
                listener: (context, state) {
                  if (state is SuccsessCommentState) {
                    commentTextController.clear();

                    SnackBarMessage().showSuccessSnackBar(
                        message: state.message, context: context);

                    customNavigate(context, AppNamePage.commentsPage);
                  } else if (state is ErrorCommentState) {
                    SnackBarMessage().showErrorSnackBar(
                        message: state.message, context: context);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingCommentState) {
                    return const LoadingWidget();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
