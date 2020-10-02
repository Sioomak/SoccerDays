////Login Screen Login Button
//
//Widget _buildLoginBtn() {
////  return Container(
////    padding: EdgeInsets.symmetric(vertical: 25.0),
////    width: double.infinity,
////    child: Opacity(
////      opacity: 0.7,
////      child: isLoading
////          ? Center(
////              child: CircularProgressIndicator(
////                strokeWidth: 8.0,
////                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
////              ),
////            )
////          : RaisedButton(
////              elevation: 5.0,
////              onPressed: () {
////                setState(() {
////                  isLoading = true;
////                  logingIn = false;
////                });
////                print("is loading? $isLoading");
////                print("user pass enabled? $logingIn ");
////                print(_email);
////                print(_password);
////
////                if (!_formKey.currentState.validate()) {
////                  return;
////                }
////                _formKey.currentState.save();
////              },
////              padding: EdgeInsets.all(15.0),
////              shape: RoundedRectangleBorder(
////                borderRadius: BorderRadius.circular(30.0),
////              ),
////              color: Colors.white,
////              child: Text(
////                'LOG IN',
////                style: TextStyle(
////                  color: Color(0xFF3b5249),
////                  letterSpacing: 1.5,
////                  fontSize: 18.0,
////                  fontWeight: FontWeight.bold,
////                  fontFamily: 'OpenSans',
////                ),
////              ),
////            ),
////    ),
////  );
////}
