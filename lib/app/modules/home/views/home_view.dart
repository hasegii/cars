import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог тачек'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text('Status: ${controller.status.value.name}'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () => controller.getData(),
                  child: const Text('Обновить'),
                ),
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.cars.length,
                      itemBuilder: (context, index) {
                        var curCar = controller.cars[index];
                        return GestureDetector(
                          onTap: () => Get.toNamed('car', arguments: curCar),
                          child: Card(
                            elevation: 1,
                            child: ListTile(
                              leading: Text(curCar.id.toString()),
                              title: Text('${curCar.brand} ${curCar.model}'),
                              subtitle: Text(curCar.price.toString()),
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
