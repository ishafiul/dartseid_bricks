import 'package:dartseid/dartseid.dart';

Future<void> main() {
  return runServer(
      port: 8080,
      init: () {
        Route.get('/hello').handle((RequestContext context) => 'Hello World!');

        // Add the following route
        Route.get('/hello/:message').handle((RequestContext context) {
          final message = context.pathParameters['message'];
          final time = DateTime.now().toIso8601String();

          return {
            'message': message,
            'time': time,
          };
        });
      });
}
