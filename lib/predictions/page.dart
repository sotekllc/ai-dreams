import 'package:flutter/cupertino.dart';

class PredictionsPage extends StatefulWidget {
  const PredictionsPage({Key? key}) : super(key: key);

  @override
  _PredictionsPageState createState() => _PredictionsPageState();
}

class _PredictionsPageState extends State<PredictionsPage> {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: CupertinoScrollbar(
        thickness: 6.0,
        thicknessWhileDragging: 10.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // Top Bar ^ on scaffold

              // Form: text-to-image predictions w/ buttons

              // Examples list (grid, squares, ~6 examples that use an actual model)

            ],
          ),
        ),
      ),
      // child: ScrollView(scrollDirection: Axis.vertical,

      // ),
    );
  }
}
