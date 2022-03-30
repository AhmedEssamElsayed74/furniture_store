import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/modules/user/login/cubit/states.dart';



class LogingCubit extends Cubit <Logingstates>
{
  LogingCubit( ) : super(LogingInitialstate());

  static LogingCubit get(context)=>BlocProvider.of(context);



  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changepassword ()
  {
    isPassword =!isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(Changepasswordstate());
  }

}