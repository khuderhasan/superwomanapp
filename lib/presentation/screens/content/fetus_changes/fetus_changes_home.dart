import 'package:flutter/material.dart';
import '../../../../config/validators.dart';
import '../../components/app_logo_image.dart';
import 'fetus_changes_month.dart';

class FetusChangesHome extends StatelessWidget {
  const FetusChangesHome({super.key});
  static const routeName = "/fetus_changes_home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoImage(headline: "Mother and Fetus Changes"),
              Row(
                children: [
                  const Spacer(),
                  Flexible(
                      flex: 10,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String month = getMonth(index + 1);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FetusMonth(monthIndex: index + 1),
                                        ));
                                  },
                                  child: Text("$month Month")),
                            );
                          },
                          itemCount: 9,
                        ),
                      )),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
