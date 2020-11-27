
import 'package:flutter/material.dart';

///渐变色button
class GradientButton extends StatelessWidget {
  
  final List<Color> colors;
  final double width;
  final double height;
  
  final Widget child;
  final BorderRadius borderRadius;
  
  //点击回调
  final GestureTapCallback onPressed;
  
  GradientButton({
    this.colors, this.width, this.height, this.borderRadius, this.onPressed, @required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    
    ThemeData theme = Theme.of(context);
    
    //确保colors数组不为空
    List<Color> _colors = colors ?? 
          [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius
        ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
}