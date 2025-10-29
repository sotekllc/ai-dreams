import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:ai_dreams/theme_provider.dart';

class GenerationScreen extends StatefulWidget {
  const GenerationScreen({Key? key}) : super(key: key);

  @override
  _GenerationScreenState createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CupertinoPageScaffold(
      backgroundColor: themeProvider.theme.scaffoldBackgroundColor,
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
                    Text('List of Models'),

                    // Form: text-to-image predictions w/ buttons
                    Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: [
                            Text('text area field'),
                            Text('generate button'),
                            Text('generate prompt button'),
                          ],
                        ),
                      ),
                    ),

                    // Examples list (grid, squares, ~6 examples that use an actual model)
                    Text('Examples grid'),

                    // GridView.count(
                    //   crossAxisCount: 2, // Number of columns
                    //   crossAxisSpacing: 8,
                    //   mainAxisSpacing: 8,
                    //   padding: const EdgeInsets.all(8),
                    //   children: List.generate(6, (index) {
                    //     return Container(
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: Colors.blueAccent,
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       child: Text('Item $index', style: TextStyle(color: Colors.white)),
                    //     );
                    //   }),
                    // ),
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
