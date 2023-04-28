import 'package:flutter/material.dart';

import 'home_page.dart';

/// [GetAQuote] is a [StatefulWidget].
/// It takes [withIcons] and [destinationEmail] as its arguments.
/// This widget creates a Contact Form which has 3 [TextFormField],
/// [Name], [Email] and [Message].
///
class GetAQuote extends StatefulWidget {
  /// [withIcons] is a [bool] variable which decides
  /// whether the contact form has icons or not.
  final bool withIcons;

  /// [destinationEmail] is a [String] variable which cannot be null.
  /// The destinationEmail must be a proper email address of the reciever.
  /// The message entered will be sent as a mail for the destinationEmail.
  final String destinationEmail;

  /// [hasHeading] is a [bool] variable.
  /// If it is set to true. then it displays a Contact Form text as a heading
  /// in the widget. And if set to false, there will be only [Name], [Email]
  /// [Message] and a submit [Button]
  final bool hasHeading;

  /// [GetAQuote] has 2 [required] fields [withIcons] and [destinationEmail].
  const GetAQuote({
    Key? key,
    this.hasHeading = true,
    required this.withIcons,
    required this.destinationEmail,
  }) : super(key: key);

  @override
  State<GetAQuote> createState() => _GetAQuoteState();
}

class _GetAQuoteState extends State<GetAQuote> {
  /// Initializing a [GlobalKey] of type [FormState]
  /// [_formKey] is helpful to store [FormState] of the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Initializing a [TextEditingController] for [Name] field as [_nameEditingController]
  final TextEditingController _nameEditingController = TextEditingController();

  /// Initializing a [TextEditingController] for [Email] field as [_emailEditingController]
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _mobileEditingController = TextEditingController();

  /// Initializing a [TextEditingController] for [Message] field as [_messageEditingController]
  final TextEditingController _messageEditingController =
  TextEditingController();

  /// [name] store the value from [_nameEditingController]
  /// And it is validated by [_validateName]
  String? name;

  /// [email] store the value from [_emailEditingController]
  /// And it is validated by [_validateEmail]
  String? email;

  /// [message] store the value from [_messageEditingController]
  /// And it is validated by [_validateMessage]
  ///
  String? mobile;
  String? message;

  /// Overrides the parent's [dispose] method.
  ///
  /// After using the [_nameEditingController], [_emailEditingController]
  /// and [_messageEditingController], [TextEditingController]s
  @override
  void dispose() {
    // Disposing [_nameEditingController]
    _nameEditingController.dispose();
    // Disposing [_emailEditingController]
    _emailEditingController.dispose();
    // Disposing [_messageEditingController]
    _messageEditingController.dispose();
    _mobileEditingController.dispose();
    super.dispose();
  }

  /// [_validateName] validates the value of [_name]
  String? _validateName(String name) {
    // Regular Expression for fullname (a space between first name and second name)
    String nameRegExp = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";

    if (name.isEmpty) {
      // Name field should not be empty
      return 'Enter your name';
    }
    if (!RegExp(nameRegExp).hasMatch(name)) {
      // If the value in name field doesn't match with the regular expression
      // then it throws an error message.
      return 'Give a space between \nyour first name and last name';
    }
    return null;
  }

  /// [_validateEmail] validates the value of [_email]
  String? _validateEmail(String email) {
    // Regular Expression for email
    String emailRegExp =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (email.isEmpty) {
      // Name field should not be empty
      return 'Enter your email';
    }
    if (!RegExp(emailRegExp).hasMatch(email)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: username@example.com';
    }
    return null;
  }

  /// [_validateEmail] validates the value of [_email]
  String? _validateMobile(String mobile ) {
    // Regular Expression for mpbile
    String mobileRegExp = (r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (mobile.isEmpty) {
      // Name field should not be empty
      return 'Enter your mobile number';
    }
    if (!RegExp(mobileRegExp).hasMatch(mobile)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: 9685XXXX81';
    }
    return null;
  }

  /// [_validateMessage] validates the value of [_message]
  String? _validateMessage(String name) {
    if (name.isEmpty) {
      // Message field should not be empty
      return 'Message is empty. Please fill it.';
    }
    return null;
  }

  /// [_sendEmail] redirects to gmail app with the message and name
  /// entered by the user.
  // void _sendEmail(
  //     {required String destEmail, required String body, required String name}) {
  //   String? encodeQueryParameters(Map<String, String> params) {
  //     return params.entries
  //         .map((e) =>
  //     '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
  //         .join('&');
  //   }
  //
  //   /// [emailLaunchUri] sends an email to the destination email.
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: destEmail,
  //     query: encodeQueryParameters(<String, String>{
  //       'subject': 'Feedback from $name',
  //       'body': body,
  //     }),
  //   );
  //
  //   // Launching the URL.
  //   //launchUrl(emailLaunchUri);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.indigo),
        elevation: 0,
        backgroundColor: Colors.transparent,
       // leading: ICO,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 10,
         // bottom: 32,
        ),

        /// Contact Form
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 32,
               // bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  widget.hasHeading
                      ? const Text(
                    'Get A Quotation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  )
                      : Container(),
                  Divider(),

                  const SizedBox(
                    height: 24,
                  ),
                  // Name Field
                  TextFormField(
                    controller: _nameEditingController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => _validateName(value!),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value!;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: widget.withIcons
                          ? Icon(Icons.person_outline,color: Colors.indigo.withOpacity(0.5))
                          : null,
                      label: const Text('Name'),
                      hintText: 'FirstName LastName',
                      border: const OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  // Mobile Field
                  TextFormField(
                    controller: _mobileEditingController,
                    keyboardType: TextInputType.phone,
                    //textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => _validateMobile(value!),
                    onChanged: (value) {
                      setState(() {
                        mobile = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        mobile = value!;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: widget.withIcons
                          ?  Icon(Icons.phone_android,color: Colors.indigo.withOpacity(0.5),)
                          : null,
                      label: const Text('Mobile'),
                      hintText: 'Enter your 10 digit mobile number',
                      border: const OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  // Email Field
                  TextFormField(
                    controller: _emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => _validateEmail(value!),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: widget.withIcons
                          ?  Icon(Icons.alternate_email,color: Colors.indigo.withOpacity(0.5))
                          : null,
                      label: const Text('E-mail'),
                      hintText: 'Email',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Message or Feedback Field
                  TextFormField(
                    controller: _messageEditingController,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    textCapitalization: TextCapitalization.sentences,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => _validateMessage(value!),
                    onChanged: (value) {
                      setState(() {
                        message = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        message = value!;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: widget.withIcons
                          ?  Icon(Icons.message_outlined,color: Colors.indigo.withOpacity(0.5))
                          : null,
                      label: const Text('Message'),
                      hintText: 'Message',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Submit button
                  SizedBox(
                    height: 45,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      textColor: Colors.purple.shade600,
                      color: Colors.indigo.withOpacity(0.5),
                      //isIconButton: true,
                      elevation: 0,
                      //roundness: 10,

                      child: Text('Get A Quote',style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                        color: Colors.indigo.shade600
                      ),),
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            setState(() {

                             SnackBar(content: Text('We Will Get Back To You'));


                                  showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder: (context, setState) {
                                      return  AlertDialog(
                                        shadowColor: Colors.indigo.withOpacity(0.5),
                                        title: const Text('We Will Get Back To You \nVery Soon',textAlign: TextAlign.center,),
                                      );},);},);
                                      Future.delayed(const Duration(seconds: 2),()=>
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))

                                // _sendEmail(
                                //   name: name.toString(),
                                //   destEmail: widget.destinationEmail,
                                //   body: message.toString(),
                              );
                            });
                          }



                        },


                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
