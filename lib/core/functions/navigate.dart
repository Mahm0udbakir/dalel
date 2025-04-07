import 'package:go_router/go_router.dart';

void navigateUsingGo(context, path) {
  GoRouter.of(context).go(path);
}

void navigateWithBackButton(context, path) {
  GoRouter.of(context).push(path);
}

void navigateWithOutBackButton(context, path) {
  GoRouter.of(context).pushReplacement(path);
}
