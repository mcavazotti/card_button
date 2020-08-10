library card_button;

import 'package:flutter/material.dart';

/// A material button based on a Card. This widget can have an image or icon, a title and a small description.
/// [image] will be ignored if a [icon] is provided
class CardButton extends StatelessWidget {
  final String title;
  final String description;

  /// This argument is typed as a generic Widget to allow flexibility
  final Widget image;
  final IconData icon;
  final double height, width;

  /// Optional style for the [title]. If none is provided, the title will be styled as a header6
  final TextStyle textStyle;
  final void Function() onTap;

  static const double defaultHeight = 200;
  static const double defaultWidth = 150;

  CardButton(
      {@required this.title,
      @required this.onTap,
      this.description,
      this.image,
      this.icon,
      this.height = defaultHeight,
      this.width = defaultWidth,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    double _smallerSize = width < height ? width : height;
    TextStyle _textStyle = textStyle ?? Theme.of(context).textTheme.headline6;
    Widget visualHeader;
    if (icon != null) {
      visualHeader = Icon(
        icon,
        size: _smallerSize - (30 + 0.1 * _smallerSize),
      );
    } else if (image != null) {
      visualHeader = image;
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, offset: Offset(1, 2))
          ]),
      child: Material(
          color: Theme.of(context).cardColor,
          child: InkWell(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (visualHeader != null) visualHeader,
                  Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      child: Column(
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: description == null ? 2 : 1,
                            style: _textStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (description != null)
                            Text(
                              description,
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )
                        ],
                      )),
                ]),
            onTap: onTap,
          )),
    );
  }
}
