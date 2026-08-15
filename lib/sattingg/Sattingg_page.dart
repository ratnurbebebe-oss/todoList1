 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_todolist_1/setting/setting_cubit.dart';

class SattinggPage extends StatelessWidget{
  const SattinggPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SettingCubit(),
      child: BlocBuilder<SettingCubit, bool>(
        builder: (context, isDark){
          return Scaffold(
            backgroundColor: isDark? Colors.black: Colors.white,
            appBar: AppBar(
              title: const Text("Настройки"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Выберите тему",
                    style: TextStyle(
                      color: isDark? Colors.white: Colors.black,

                    ),
                  ),
                  Switch(
                   value:isDark,
                   onChanged:(value){
                    context.read<SettingCubit>().changeTheme();
                   }
                  ),
                  
                ],
              ),
            ),
          );
        }), );
  }
}