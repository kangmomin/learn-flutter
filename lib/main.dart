import 'package:flutter/material.dart';
import './widgets/Button.dart';
import './widgets/Cards.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    const Text(
                      "hey, selena",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ])
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                    fontSize: 22, color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(bgColor: Colors.amber, text: "transfer"),
                  Button(
                      bgColor: Color(0xFF1F2123),
                      text: "Request",
                      textColor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        color: Colors.white),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrencyCards(
                amount: "6 428",
                code: "EUR",
                icon: Icons.euro_rounded,
                name: "Euro",
                isInverted: false,
              ),
              Transform.translate(
                offset: const Offset(0, -20),
                child: const CurrencyCards(
                  amount: "9 785",
                  code: "Bitcoin",
                  icon: Icons.currency_bitcoin_rounded,
                  name: "BTC",
                  isInverted: true,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: const CurrencyCards(
                    name: "Dollar",
                    code: 'USD',
                    amount: '428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
