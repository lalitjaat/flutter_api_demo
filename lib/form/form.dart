import 'package:flutter/material.dart';

import '../constants.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? country;
  String? state;
  String? city;

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> countryOptions = ['USA', 'Canada', 'India'];
  Map<String, List<String>> stateOptions = {
    'USA': ['New York', 'California', 'Texas'],
    'Canada': ['Ontario', 'Quebec', 'Alberta'],
    'India': ['Maharashtra', 'Karnataka', 'Delhi'],
  };
  List<String> cityOptions = ['New York City', 'Los Angeles', 'Houston'];

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          appBar: app_Bar('Form Validation'),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!isNumeric(value)) {
                      return 'Please enter a valid numeric phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phone = value;
                  },
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<String>(
                  value: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  items: genderOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<String>(
                  value: country,
                  onChanged: (value) {
                    setState(() {
                      country = value;
                      state = null;
                    });
                  },
                  items: countryOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<String>(
                  value: state,
                  onChanged: (value) {
                    setState(() {
                      state = value;
                    });
                  },
                  items: stateOptions[country ?? '']?.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList() ??
                      [],
                  decoration: const InputDecoration(
                    labelText: 'State',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<String>(
                  value: city,
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                  items: cityOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(backgroundColor)),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
