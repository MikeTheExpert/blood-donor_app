import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget{
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.grey,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyIconBtn(
                icon: const Icon(Icons.home,),
                onPressed: (){
                  Navigator.of(context).pop;
                  Navigator.pushNamed(context, 'home_page');
                },
              ),

              MyIconBtn(
                icon: const Icon(Icons.data_saver_on),
                onPressed: (){
                  Navigator.of(context).pop;
                  Navigator.pushNamed(context, 'donor_page');
                }
              ),
              MyIconBtn(
                  icon: const Icon(Icons.yard_rounded),
                  onPressed: (){
                    Navigator.of(context).pop;
                    Navigator.pushNamed(context, 'login_page');
                  }
              ),
              MyIconBtn(
                  icon: const Icon(Icons.how_to_reg),
                  onPressed: (){
                    Navigator.of(context).pop;
                    Navigator.pushNamed(context, 'register_page');
                  }
              ),
              MyIconBtn(
                  icon: const Icon(Icons.recommend_rounded),
                  onPressed: (){
                    Navigator.of(context).pop;
                    Navigator.pushNamed(context, 'request_page');
                  }
              ),
              MyIconBtn(
                  icon: const Icon(Icons.login),
                  onPressed: (){
                    Navigator.of(context).pop;
                    Navigator.pushNamed(context, 'profile_page');
                  }
              ),
              MyIconBtn(
                  icon: const Icon(Icons.foggy),
                  onPressed: (){
                    Navigator.of(context).pop;
                    Navigator.pushNamed(context, 'donate_form');
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

}
// ignore_for_file: file_names


// ignore: must_be_immutable
class MyIconBtn extends StatefulWidget {
  final Icon icon;
  Function()? onPressed;

  MyIconBtn({super.key, required this.icon, required this.onPressed});

  @override
  State<MyIconBtn> createState() => _MyIconBtnState();
}

class _MyIconBtnState extends State<MyIconBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36,
        width: 36,
        child: IconButton(
          onPressed: widget.onPressed,
          icon: widget.icon,
          focusColor: Colors.lightBlue,
        ));
  }
}
