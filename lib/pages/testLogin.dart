//
//
//    return FutureBuilder(
//      // Initialize FlutterFire
//      future: Firebase.initializeApp(),
//      builder: (context, snapshot) {
//        // Check for errors
//        if (snapshot.hasError) {
//          return SomethingWentWrong();
//        }
//
//        // Once complete, show your application
//        if (snapshot.connectionState == ConnectionState.done) {
//          return MyAwesomeApp();
//        }
//
//        // Otherwise, show something whilst waiting for initialization to complete
//        return Loading();
//      },
//    );
