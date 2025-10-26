import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/**
 * Service for bootstrapping the application including
 * the loading of required environment variables.
 */
String dotEnvFilePath = "assets/.env";

class BootstrapService {

  static Future<void> loadEnv() async {
    await dotenv.load(
      fileName: dotEnvFilePath
    );
    await rootBundle.loadString(dotEnvFilePath);
  }

  // static Future<String> get(String key) async {
  //   await rootBundle.loadString(dotEnvFilePath);
  //   Map<String, String> dotEnv = dotenv.env;
  //   return dotEnv[key] ?? '';
  // }

// await dotenv.load(
//   fileName: "assets/.env",
//   // mergeWith optional, you can include Platform.environment for Mobile/Desktop app
//   mergeWith: {
//     'TEST_VAR': '5',
//   },
//   // overrideWith optional, you can include additional .env files
//   overrideWithFiles: ["assets/.env.override"],
// );

// FutureBuilder<String>(
//   future: rootBundle.loadString('assets/.env'),
//   initialData: '',
//   builder: (context, snapshot) => Container(
//     padding: const EdgeInsets.all(50),
//     child: Column(
//       children: [
//         Text(
//           'Env map: ${dotenv.env.toString()}',
//         ),
//         const Divider(thickness: 5),
//         const Text('Original'),
//         const Divider(),
//         Text(snapshot.data ?? ''),
//         Text(dotenv.get('MISSING',
//             fallback: 'Default fallback value')),
//       ],
//     ),
//   ),
// ),

}