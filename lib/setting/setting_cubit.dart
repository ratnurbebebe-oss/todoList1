import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_1/sattingg/sattingg_page.dart';
class SettingCubit extends Cubit<bool>{
  SettingCubit(): super(false);
  void changeTheme(){
    emit(!state);
  }
}