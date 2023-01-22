import 'package:flutter/material.dart';
import 'package:pharmabox/Theme/color.dart';
import 'package:pharmabox/Theme/text.dart';
import 'package:pharmabox/Widgets/gradientText.dart';
import 'package:pharmabox/constants.dart';
import 'package:pharmabox/custom_decorations_class/custom_gradient_slider.dart';

class CustomTextWithGradientSlider extends StatefulWidget {
  final String title;
  final double initialValue;
  final String assetImage;
  final int categoryCount;
  const CustomTextWithGradientSlider({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.assetImage,
    required this.categoryCount,
  }) : super(key: key);

  @override
  State<CustomTextWithGradientSlider> createState() =>
      _CustomTextWithGradientSliderState();
}

class _CustomTextWithGradientSliderState
    extends State<CustomTextWithGradientSlider> {
  double value = 0.0;
  String labelText = '';

  LinearGradient _gradient = const LinearGradient(colors: []);

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (widget.categoryCount == 3) {
      if (value < 50) {
        labelText = 'Basique';
        _gradient = kbasicGradient;
      } else if (value > 50 && value < 80) {
        labelText = 'Intérmédiaire';
        _gradient = kintermediateLevelGradient;
      } else {
        labelText = 'Couramment';
        _gradient = kexpertLevelGradient;
      }
      setState(() {});
    } else {
      if (value < 50) {
        labelText = 'Moyen';
        _gradient = kintermediateLevelGradient;
      } else {
        labelText = 'Maitrise complète';
        _gradient = kexpertLevelGradient;
      }
      setState(() {});
    }
    return Flexible(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.035,
                  ),
                  Image(
                    image: const AssetImage('assets/icons/deleteicon.png'),
                    height: height * 0.025,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Image(
                    image: AssetImage(widget.assetImage),
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    widget.title,
                    style: paragraph,
                  ),
                ],
              ),
            ),
            // Spacer(
            //   flex: 2,
            // ),
            Container(
              // color: lightGreen,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GradientText(
                    labelText,
                    style: const TextStyle(fontSize: 10),
                    gradient: _gradient,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: SliderTheme(
                      data: SliderThemeData(
                        showValueIndicator: ShowValueIndicator.never,
                        minThumbSeparation: 0.00,
                        thumbColor: widget.categoryCount == 3
                            ? value < 50
                                ? const Color.fromRGBO(248, 153, 153, 1)
                                : value > 50 && value < 80
                                    ? const Color.fromRGBO(253, 197, 113, 1)
                                    : const Color.fromRGBO(124, 237, 172, 1)
                            : value < 50
                                ? const Color.fromRGBO(255, 222, 172, 1)
                                : const Color.fromRGBO(124, 237, 172, 1),
                        trackHeight: 2,
                        trackShape: GradientRectSliderTrackShape(
                          gradient: _gradient,
                        ),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: value,
                        // divisions: 4,

                        onChanged: (double val) {
                          setState(() {
                            value = val;
                          });
                        },
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                ],
              ),
            ),
            // SizedBox(
            //   width: widget.categoryCount == 3
            //       ? MediaQuery.of(context).size.width * 0.05
            //       : 0,
            // ),
          ],
        ),
      ),
    );
  }
}
