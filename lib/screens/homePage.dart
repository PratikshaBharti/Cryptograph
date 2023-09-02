import 'package:cryptoapp/Controllers/coins_controllers.dart';
import 'package:cryptoapp/screens/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crypto Market",
                  style: textStyle(25, Colors.white, FontWeight.bold)),
              Obx(() => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[700],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[700]!,
                                              offset: Offset(4, 4),
                                              blurRadius: 5)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.network(
                                            controller.coinsList[index].image),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.coinsList[index].name,
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w600),
                                        ),
                                        Text(
                                          "${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                          style: textStyle(
                                              18, Colors.grey, FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${controller.coinsList[index].currentPrice.round()}",
                                      style: textStyle(
                                          18, Colors.white, FontWeight.w600),
                                    ),
                                    Text(
                                      controller.coinsList[index].symbol
                                          .toUpperCase(),
                                      style: textStyle(
                                          18, Colors.grey, FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
