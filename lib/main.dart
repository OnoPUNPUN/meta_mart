import 'package:meta_mart/src/app.dart';
import 'package:meta_mart/src/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const MetaMart());
}
