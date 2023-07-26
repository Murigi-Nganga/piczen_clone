import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:piczen_clone/app.dart';
import 'package:piczen_clone/bootstrap.dart';

void main() async {
  await dotenv.load();

  await bootstrap(() => const App());
}
