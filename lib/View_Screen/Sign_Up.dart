

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import 'package:provider/provider.dart';

import '../View_model/auth_view_model.dart';
import '../resources/components/round_button.dart';
import '../utilities/utiles.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  ValueNotifier<bool> _togle = ValueNotifier<bool>(true);

  FocusNode emailFocusnode = FocusNode();
  FocusNode passFoucusnode = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final authViewModel=Provider.of<AuthViewModel>(context);

  final height=MediaQuery.of(context).size.height*1;
  return SafeArea(
  child: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.blue,
  title: Text("SignUp Page"),
  centerTitle: true,
  ),
  body: Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  TextFormField(
  keyboardType: TextInputType.emailAddress,
  focusNode: emailFocusnode,
  controller: _emailController,
  decoration: InputDecoration(
  label: Text("Emal"),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(13)
  ),
  prefixIcon: Icon(Icons.alternate_email)
  ),
  onFieldSubmitted: (value){
  Utiles.fieldFoucsChange(context, emailFocusnode, passFoucusnode);
  },
  ),
  SizedBox(height: height*.03,),
  ValueListenableBuilder(
  valueListenable: _togle,
  builder: (context, vlaue, child){
  return TextFormField(
  focusNode: passFoucusnode,
  controller: _passController,
  obscureText: _togle.value,
  decoration: InputDecoration(
  label: Text("Password"),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(13)
  ),
  suffixIcon: InkWell(
  onTap: (){
  _togle.value = !_togle.value;
  },
  child: Icon(_togle.value ? Icons.visibility_off_outlined:
  Icons.visibility
  ))
  ),
  );
  }),
  SizedBox(height: height*.05,),
  RoundButton(title: 'Sign Up', loading: authViewModel.signUploading, onPress: () {
  if(_emailController.text.isEmpty){
  Utiles.flushBarErrorMessage('Please enter email', context);
  }else if(_passController.text.isEmpty){
  Utiles.flushBarErrorMessage('Please enter password', context);
  }else if(_passController.text==8){
  Utiles.flushBarErrorMessage('Password which conatain only 8 letters', context);
  }else{
  Map data = {
  'email': _emailController.text.toString(),
  'password':_passController.text.toString(),
  };
  authViewModel.SingUpApi(data, context);
  print("Api hit");
  }
  },
  ),
  SizedBox(height: height*.05,),
  InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesName.login);
      },
      child: Text("Already have an Account? Sign In")),
  ],
  ),
  )
  ),
  );
  }
  }
