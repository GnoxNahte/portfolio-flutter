import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_app_bar.dart';

class ErrorData {
  final int errorCode;
  final String errorMsg;

  ErrorData(this.errorCode, this.errorMsg);
}

class ErrorPage extends StatelessWidget {

  final ErrorData errorData;

  const ErrorPage(this.errorData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioAppBar(appBar: AppBar(), pageName: "Error Page"),
      body: Center(
        child: Column(
          children: [
            const Text("Error!"),
            Text("Error code: ${errorData.errorCode}"),
            Text("Message: ${errorData.errorMsg}"),
          ],
        ),
      ),
    );
  }
}