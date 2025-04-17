import 'package:crafty_bay_app/data/models/payment_method.dart';
import 'package:crafty_bay_app/data/models/payment_method_response_data.dart';
import 'package:crafty_bay_app/presentation/ui/screens/payment_gateway_webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/paymetn_method_list_controller.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<PaymentMethodListController>().getPaymentMethodList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment details")),
      body: GetBuilder<PaymentMethodListController>(
        builder: (paymentMethodListController) {
          if (paymentMethodListController.inProgress) {
            return CircularProgressIndicator();
          }
          if (paymentMethodListController.errorMessage != null) {
            return Center(
              child: Text(paymentMethodListController.errorMessage!),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildPaySummaryRow(
                    title: "Total",
                    amount:
                        "${paymentMethodListController.paymentMethodResponseData!.total}",
                  ),
                  _buildPaySummaryRow(
                    title: "VAT",
                    amount:
                        "${paymentMethodListController.paymentMethodResponseData!.vat}",
                  ),
                  _buildPaySummaryRow(
                    title: "Total Payable",
                    amount:
                        "${paymentMethodListController.paymentMethodResponseData!.payable}",
                  ),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:
                        paymentMethodListController
                            .paymentMethodResponseData!
                            .paymentMethod
                            ?.length ??
                        0,
                    itemBuilder: (context, index) {
                      final PaymentMethod paymentMethod =
                          paymentMethodListController
                              .paymentMethodResponseData!
                              .paymentMethod![index];
                      return ListTile(
                        title: Text(paymentMethod.name!),
                        leading: Image.network(paymentMethod.logo!),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Get.to(
                            () => PaymentGatewayWebview(
                              gatewayUrl: paymentMethod.redirectGatewayURL!,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaySummaryRow({required String title, required String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text("\$$amount", style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
