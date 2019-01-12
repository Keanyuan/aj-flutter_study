import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.black),
                SpinKitRotatingPlain(color: Colors.black),
                SpinKitChasingDots(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.black),
                SpinKitPulse(color: Colors.black),
                SpinKitDoubleBounce(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.black, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.black, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.black, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.black),
                SpinKitWanderingCubes(color: Colors.black),
                SpinKitWanderingCubes(
                    color: Colors.black, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.black),
                SpinKitFadingFour(color: Colors.black),
                SpinKitFadingFour(
                    color: Colors.black, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.black),
                SpinKitCubeGrid(size: 51.0, color: Colors.black),
                SpinKitFoldingCube(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.black),
                SpinKitDualRing(color: Colors.black),
                SpinKitRipple(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.black),
                SpinKitFadingGrid(
                    color: Colors.black, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.black),
                SpinKitSpinningCircle(
                    color: Colors.black, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.black),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.black),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
