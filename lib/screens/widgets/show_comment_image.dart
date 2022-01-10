import 'package:comment_app/screens/widgets/network_image.dart';
import 'package:comment_app/utils/colors_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proste_dialog/proste_dialog.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CommentImage {
  static void showImage({
    required BuildContext context,
    SuperTooltip? tooltip,
    required List<String> imageList,
  }) {
    DialogTipType _tipType = DialogTipType.success;
    late Animation _animation;
    late AnimationController _animationController;

    showDialog(
      context: context,
      builder: (_) => ProsteCustomDialog(
        insetPadding: EdgeInsets.zero,
        dialogRadius: 5,

        content: ViewImageSlider(
          imageList: imageList,
        ),
        titlePadding: EdgeInsets.only(top: 0),
        contentPadding: EdgeInsets.only(top: 0),
        showConfirmButton: false,
        showCancelButton: false,
        confirmButtonColor: Colors.cyan,
        cancelButtonColor: Colors.black,
      ),
    );
  }
}

class ViewImageSlider extends StatefulWidget {
  ViewImageSlider({
    required this.imageList,
    Key? key,
  }) : super(key: key);
  final List<String> imageList;
  int index = 0;

  @override
  State<ViewImageSlider> createState() => _ViewImageSliderState();
}

class _ViewImageSliderState extends State<ViewImageSlider> {
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Container(
      height: 500,
      child: Column(
        children: [
          if (!widget.imageList.isEmpty)
            Container(
              height: 470,
              width: size.width,
              color: kBlack,
              child: NetworkImageWithErrorBuilder(
                userImgUrl:widget.imageList[widget.index]
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    Icons.skip_next_rounded,
                    size: 30,
                  ),
                  onTap: () {
                    setState(() {
                      if ((widget.imageList.length - 1) == widget.index) return;
                      ++widget.index;
                    });
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.skip_previous,
                    size: 30,
                  ),
                  onTap: () {
                    setState(() {
                      if (0 == widget.index) return;
                      --widget.index;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
