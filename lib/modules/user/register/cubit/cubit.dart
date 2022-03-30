import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/modules/user/register/cubit/states.dart';



class RegisterCubit extends Cubit <Registerstates>
{
  RegisterCubit( ) : super(RegisterInitialstate());

  static RegisterCubit get(context)=>BlocProvider.of(context);


  bool values = true;
  bool privacy = false;

  void changeprivacy ()
  {
    privacy =!privacy;
    emit(Changeprivacystate());
  }

  void changevalue ()
  {
    values =!values;
    emit(Changevaluesstate());
  }





  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changepassword ()
  {
    isPassword =!isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(Changepasswordvisabiltystate());
  }


}