import 'package:create_box/components/app_bar/my_app_bar_for_another_page.dart';
import 'package:create_box/components/for_content_of_page/buttons/my_blue_button_for_order.dart';
import 'package:create_box/features/order_page/model/customer.dart';
import 'package:create_box/repository/bestsellers/order_repository.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.id});
  final int id;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = "Payment in post office"; // Selected value

    List<String> paymentOptions = ["Payment in post office"];

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late Customer customer;
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    String? validateFullName(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your full name';
      } else if (value.trim().isEmpty) {
        return 'Full name should not consist only of spaces';
      } else if (value.length < 5) {
        return 'Full name should be at least 5 characters long';
      } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
        return 'Full name should only contain letters';
      }
      return null;
    }

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email field cannot be empty';
      }
      if (value.trim().isEmpty) {
        return 'Email cannot consist of only spaces';
      }
      final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailPattern.hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null;
    }

    String? validatePhone(String? value) {
      if (value == null || value.isEmpty) {
        return 'Phone number is required';
      }
      if (value.trim().isEmpty) {
        return 'Phone number cannot be just spaces';
      }
      if (value.length != 13 || !value.startsWith('+')) {
        return 'Invalid phone number format';
      }
      if (!RegExp(r'^\+[0-9]+$').hasMatch(value)) {
        return 'Phone number can only contain digits';
      }
      return null;
    }

    String? validateAddress(String? value) {
      if (value == null || value.isEmpty) {
        return 'Address post office cannot be empty';
      } else if (value.trim().isEmpty) {
        return 'Address post office cannot consist of only spaces';
      }
      return null;
    }

    return Scaffold(
      appBar: const MyAppBarForAnotherPage(
        title: 'Order',
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD0D5FF), // #D0D5FF
              Color(0xFFFFF2DD), // #FFF2DD
            ],
            stops: [0.1203, 0.7025], // Gradient stops
            begin: Alignment.centerLeft, // Gradient start point
            end: Alignment.centerRight, // Gradient end point
          ),
        ),
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 40),
                  child: TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Full Name*',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      //hintText: 'Enter your full name', // Hint text
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(8)), // Border style
                    ),
                    validator: validateFullName,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email*',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      //hintText: 'Enter your email', // Hint text
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(8)), // Border style
                    ),
                    validator: validateEmail,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Phone*',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      //hintText: 'Enter your phone', // Hint text
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(8)), // Border style
                    ),
                    validator: validatePhone,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40),
                  child: TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Address post office*',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      //hintText: 'Enter your address post office', // Hint text
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(8)), // Border style
                    ),
                    validator: validateAddress,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      value: selectedValue,
                      isExpanded: true,
                      underline: const SizedBox(),
                      focusColor: Colors.white,
                      hint: const Text('Payment*'),
                      isDense: false,
                      borderRadius: BorderRadius.circular(8),
                      dropdownColor: Colors.white,
                      items: paymentOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                          style: Theme.of(context).textTheme.bodySmall),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                          fullNameController.text = fullNameController.text;
                          phoneController.text = phoneController.text;
                          addressController.text = addressController.text;
                          emailController.text = emailController.text;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyBlueButtonForOrder(
                          title: 'ORDER',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              customer = Customer(
                                fullName: fullNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                addressPostOffice: addressController.text,
                                paymentOption: selectedValue,
                              );
                              print(customer.toString());

                              OrderRepository().createOrder(
                                id: widget.id,
                                fullName: customer.fullName,
                                email: customer.email,
                                phone: customer.phone,
                                address: customer.addressPostOffice,
                                payment: customer.paymentOption,
                              );
                            } else {
                              print('hi');
                            }
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
