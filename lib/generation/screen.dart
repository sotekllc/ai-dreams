import 'package:flutter/cupertino.dart';

class GenerationScreen extends StatefulWidget {
  const GenerationScreen({Key? key}) : super(key: key);

  @override
  _GenerationScreenState createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: CupertinoScrollbar(
        thickness: 6.0,
        thicknessWhileDragging: 10.0,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              // NOTE: (?) Fix w/ MediaQuery for orientation changes?
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.minWidth,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Top Bar ^ on scaffold

                    // Form: text-to-image predictions w/ buttons

                    // Examples list (grid, squares, ~6 examples that use an actual model)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
