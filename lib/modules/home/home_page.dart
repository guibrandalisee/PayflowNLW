import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Scaffold(
          //This line is an workarround for the 1px gap between appbar and body (only happens in few devices)
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.background,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Container(
              height: 120,
              color: AppColors.primary,
              child: Center(
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                            text: "${widget.user.name}",
                            style: TextStyles.titleBoldBackground)
                      ],
                    ),
                  ),
                  subtitle: Text(
                    "Mantenha suas contas em dia",
                    style: TextStyles.captionShape,
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: NetworkImage(widget.user.photoURL!)),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            //This line is an workarround for the 1px gap between appbar and body (only happens in few devices)
            padding: const EdgeInsets.only(top: 119),
            child: [
              MeusBoletosPage(
                key: UniqueKey(),
              ),
              ExtractPage(
                key: UniqueKey(),
              ),
            ][controller.currentPage],
          ),
          bottomNavigationBar: Container(
            height: 90,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        controller.setPage(0);
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: controller.currentPage == 0
                          ? AppColors.primary
                          : AppColors.body,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(context, "/barcode_scanner");
                        setState(() {});
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.add_box_outlined,
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        controller.setPage(1);
                      });
                    },
                    icon: Icon(
                      Icons.description_outlined,
                      color: controller.currentPage == 1
                          ? AppColors.primary
                          : AppColors.body,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
