import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {

  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Gabriel',
      'last_name': 'Martinez',
      'email': 'gabmart1995@gmail.com',
      'password': '123456',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and forms'),
      ),
      // scroll view
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
          ),

          // forms
          child: Form(
            key: myFormKey,
            child: Column(

              children: <Widget> [
                CustomInputField(
                  labelText: 'Name',
                  hintText: "User's name",
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox( height: 30 ),

                CustomInputField(
                  labelText: 'Surname',
                  hintText: "User's surname",
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox( height: 30 ),

                CustomInputField(
                  labelText: 'Email',
                  hintText: "User's email",
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox( height: 30 ),

                CustomInputField(
                  labelText: 'Password',
                  hintText: "User's password",
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox( height: 30 ),

                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem( value: 'Admin', child: Text('Admin' )),
                    DropdownMenuItem( value: 'SuperUser', child: Text('SuperUser' )),
                    DropdownMenuItem( value: 'Developer', child: Text('Developer' )),
                    DropdownMenuItem( value: 'Developer Jr.', child: Text('Developer Jr.' )),
                  ],
                  onChanged: ( value ) {
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox( height: 30 ),

                ElevatedButton(
                  onPressed: () {

                    // hide the keyboard
                    FocusScope.of(context).requestFocus( FocusNode() );

                    // validate form fields
                    if ( !myFormKey.currentState!.validate()) {
                      print('no valid form');
                      return;
                    }

                    // print the form
                    print( formValues );
                  },
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center( child: Text('Save'), )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}

