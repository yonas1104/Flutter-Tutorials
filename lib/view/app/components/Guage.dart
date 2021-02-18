import 'package:flutter/material.dart';
import 'package:ligmone/constants/Colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Guage extends StatelessWidget {
  double height;
  double markerheight;
  double textsize1;
  double textsize2;
  Guage({this.height, this.markerheight, this.textsize1, this.textsize2});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 210 : height,
      child: SfRadialGauge(
          animationDuration: 3000,
          enableLoadingAnimation: true,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.white30,
                  thickness: 15),
            ),
            RadialAxis(
                showLabels: false,
                showTicks: false,
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.1,
                      widget: Text('814',
                          style: TextStyle(
                              fontSize: textsize1 == null ? 50 : textsize1,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.7,
                      widget: Text('Excellent',
                          style: TextStyle(
                              fontSize: textsize2 == null ? 18 : textsize2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))
                ]),
            RadialAxis(
              showLabels: false,
              showTicks: false,
              pointers: <GaugePointer>[
                RangePointer(
                  value: 95,
                  cornerStyle: CornerStyle.bothCurve,
                  width: 15,
                  color: CustomColors.guagecolor,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                ),
                MarkerPointer(
                  value: 95,
                  markerHeight: markerheight == null ? 34 : markerheight,
                  markerWidth: markerheight == null ? 34 : markerheight,
                  markerType: MarkerType.circle,
                  color: CustomColors.guagecolor,
                ),
                MarkerPointer(
                    value: 95,
                    markerHeight: 14,
                    markerWidth: 14,
                    markerType: MarkerType.circle,
                    color: CustomColors.white,
                    borderWidth: 2,
                    borderColor: Colors.white54)
              ],
            )
          ]),
    );
  }
}
