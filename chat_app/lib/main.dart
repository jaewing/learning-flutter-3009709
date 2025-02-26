import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      /// Current behaviour is when the app is re-run
      /// it takes you back to the Login page and
      /// makes you sign in.
      ///
      /// With following implementation, if you login
      /// and re-run app, you will be taken back to
      /// the ChatPage without having to login again.
      //TODO: Decide home widget based on login activity
      home: FutureBuilder<bool>(
        /// Waits for our async function
        /// to return final value.
        future: context.read<AuthService>().isLoggedIn(),
        /// Conditionally builds page depending
          /// on whether the future is completed or not.
        builder: (context, AsyncSnapshot<bool> snapshot) {
          /// ConnectionState.done signifies "future complete"
          if(snapshot.connectionState == ConnectionState.done){
            /// Check if snapshot hasData and
            /// if the ChatPage already exists
            /// with checking the "data" property.
            ///
            /// Not sure how the following two checks are different?
            if(snapshot.hasData && snapshot.data!){
              return ChatPage();
            }
            else
              return LoginPage();
          }
          /// Shows progress indicator until Future
          /// is finished loading.
          return CircularProgressIndicator();
        }
      ),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
