import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final GlobalKey _signUpFormkey = GlobalKey<FormState>();
  final GlobalKey _signInFormkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // * Create Account Section
              RadioListTile(
                value: Auth.signup,
                groupValue: _auth,
                tileColor: _auth == Auth.signup
                    ? GlobalVariable.backgroundColor
                    : GlobalVariable.greyBackgroundCOlor,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
                activeColor: GlobalVariable.secondaryColor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // * Sign Up Form
              _auth == Auth.signup
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      color: GlobalVariable.backgroundColor,
                      child: Form(
                        key: _signUpFormkey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Name',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              // * Sign In Section
              RadioListTile(
                value: Auth.signin,
                groupValue: _auth,
                tileColor: _auth == Auth.signin
                    ? GlobalVariable.backgroundColor
                    : GlobalVariable.greyBackgroundCOlor,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
                activeColor: GlobalVariable.secondaryColor,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // * Sign-In Form
              _auth == Auth.signin
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      color: GlobalVariable.backgroundColor,
                      child: Form(
                        key: _signInFormkey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign In',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

// class AuthScreen extends ConsumerStatefulWidget {
//   const AuthScreen({super.key});

//   static const routeName = '/auth-screen';

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
// }

// class _AuthPageState extends ConsumerState<AuthScreen> {
//   Auth _auth = Auth.signup;
//   final GlobalKey _signUpFormkey = GlobalKey<FormState>();
//   final GlobalKey _signInFormkey = GlobalKey<FormState>();

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GlobalVariable.greyBackgroundCOlor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Welcome',
//                   style: TextStyle(
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               // * Create Account Section
//               RadioListTile(
//                 value: Auth.signup,
//                 groupValue: _auth,
//                 tileColor: _auth == Auth.signup
//                     ? GlobalVariable.backgroundColor
//                     : GlobalVariable.greyBackgroundCOlor,
//                 onChanged: (Auth? val) {
//                   setState(() {
//                     _auth = val!;
//                   });
//                 },
//                 activeColor: GlobalVariable.secondaryColor,
//                 title: const Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               // * Sign Up Form
//               _auth == Auth.signup
//                   ? Container(
//                       padding: const EdgeInsets.all(8.0),
//                       color: GlobalVariable.backgroundColor,
//                       child: Form(
//                         key: _signUpFormkey,
//                         child: Column(
//                           children: [
//                             CustomTextField(
//                               controller: _nameController,
//                               hintText: 'Name',
//                             ),
//                             const SizedBox(height: 10),
//                             CustomTextField(
//                               controller: _emailController,
//                               hintText: 'Email',
//                             ),
//                             const SizedBox(height: 10),
//                             CustomTextField(
//                               controller: _passwordController,
//                               hintText: 'Password',
//                             ),
//                             const SizedBox(height: 10),
//                             CustomeButton(
//                               text: 'Sign Up',
//                               onTap: () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//               // * Sign In Section
//               RadioListTile(
//                 value: Auth.signin,
//                 groupValue: _auth,
//                 tileColor: _auth == Auth.signin
//                     ? GlobalVariable.backgroundColor
//                     : GlobalVariable.greyBackgroundCOlor,
//                 onChanged: (Auth? val) {
//                   setState(() {
//                     _auth = val!;
//                   });
//                 },
//                 activeColor: GlobalVariable.secondaryColor,
//                 title: const Text(
//                   'Sign-In',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               // * Sign-In Form
//               _auth == Auth.signin
//                   ? Container(
//                       padding: const EdgeInsets.all(8.0),
//                       color: GlobalVariable.backgroundColor,
//                       child: Form(
//                         key: _signInFormkey,
//                         child: Column(
//                           children: [
//                             CustomTextField(
//                               controller: _emailController,
//                               hintText: 'Email',
//                             ),
//                             const SizedBox(height: 10),
//                             CustomTextField(
//                               controller: _passwordController,
//                               hintText: 'Password',
//                             ),
//                             const SizedBox(height: 10),
//                             CustomeButton(
//                               text: 'Sign In',
//                               onTap: () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
