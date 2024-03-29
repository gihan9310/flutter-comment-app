import 'dart:io';

import 'package:comment_app/dtos/comment_dto.dart';
import 'package:comment_app/dtos/sub_comment_dto.dart';
import 'package:comment_app/screens/widgets/commented_image_zoom.dart';
import 'package:comment_app/screens/widgets/custom_text.dart';
import 'package:comment_app/screens/widgets/network_image.dart';
import 'package:comment_app/screens/widgets/show_comment_image.dart';
import 'package:comment_app/utils/colors_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapMainImage extends StatelessWidget {
  const TapMainImage({
    required this.index,
    Key? key,
    required this.comment,
  }) : super(key: key);

  final CommentDTO comment;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // CommentImage.showImage(
        //   context: context,
        //   imageList: comment.commentImgUrl,
        //   tapImageId: index,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            CommentedImageZoomView(imageList: comment.commentImgUrl,),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: Image.file(
                  File(comment.commentImgUrl[index]),
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.network(
                      comment.commentImgUrl[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: CustomText(text: "${comment.userDispalyName}"),
                        );
                      },
                    );
                  },
                ).image,
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            width: comment.commentImgUrl.length == 1 ? size.width : 150,

            // child: NetworkImageWithErrorBuilder(
            //   userImgUrl: comment.commentImgUrl.length > 0
            //       ? comment.commentImgUrl[index]
            //       : null,
            // ),
          ),
          if ((index == 1 && comment.commentImgUrl.length == 3) ||
              (index == 3 && comment.commentImgUrl.length > 4))
            Center(
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: kBlack.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: CustomText(
                    text:
                        "${comment.commentImgUrl.length == 3 ? comment.commentImgUrl.length - 2 : comment.commentImgUrl.length - 4}+",
                    fontColor: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
