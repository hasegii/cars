import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/car_controller.dart';

class CarView extends GetView<CarController> {
  const CarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.car.brand} ${controller.car.model}'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: const Color.fromARGB(255, 205, 205, 205),
          child: ListTile(
              leading: Text(
                '${controller.car.brand.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              title: Text(
                'Модель - ${controller.car.model.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                'Цена - ${controller.car.price.toString()}',
                style: const TextStyle(fontSize: 20),
              )),
        ),
      ),
    );
  }
}
