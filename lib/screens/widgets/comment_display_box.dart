import 'package:comment_app/dtos/comment_dto.dart';
import 'package:comment_app/screens/widgets/custom_text.dart';
import 'package:comment_app/screens/widgets/ontap_main_image.dart';
import 'package:comment_app/screens/widgets/tab_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommentDisplayBox extends StatelessWidget {
  const CommentDisplayBox({
    required this.comment,
    Key? key,
  }) : super(key: key);

  final CommentDTO comment;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: 8, left: 15, bottom: 8, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.brown.shade800.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: comment.commentedBy,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
                CustomText(
                  text: comment.getMainCommentTime(),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              // text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                if (comment.tagTo != null)
                  TextSpan(
                    text: '${comment.tagTo} ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                TextSpan(text: '${comment.comment}'),
              ],
            ),
          ),
          if (!comment.commentImgUrl.isEmpty &&
              comment.commentImgUrl.length == 1)
            SizedBox(
              height: 10,
            ),
          if (!comment.commentImgUrl.isEmpty &&
              comment.commentImgUrl.length == 1)
            Container(child: TapMainImage(index: 0, comment: comment)),
          if (!comment.commentImgUrl.isEmpty &&
              comment.commentImgUrl.length == 1)
            SizedBox(
              height: 10,
            ),
          if (!comment.commentImgUrl.isEmpty &&
              comment.commentImgUrl.length > 1)
            SizedBox(
              height: 10,
            ),
          if (!comment.commentImgUrl.isEmpty &&
              comment.commentImgUrl.length > 1)
            Container(
              width: size.width,
              height: comment.commentImgUrl.length > 3 ? 300 : 155,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: comment.commentImgUrl.length == 2
                    ? 2
                    : comment.commentImgUrl.length == 3
                        ? 2
                        : comment.commentImgUrl.length >= 4
                            ? 4
                            : comment.commentImgUrl.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: TapMainImage(
                      comment: comment,
                      index: index,
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
