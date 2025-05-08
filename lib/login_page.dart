import 'package:belajarflutter_1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool _rememberPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login berhasil!')),
      );

        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => MyKalkulatorHomePage())
          );
      }
     

    } catch (e) {
      if(mounted) {
        // Handle login error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login gagal: ${e.toString()}')),
        );
      }
    }
  }

  /*
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  //TextEditingController emailController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  String useremail = "username@pensmail.com";
  String pass = "123456";
  String notif = " ";

   void login(String email, String password) {
  
      if (email == useremail && password == pass ) {
        setState(() 
          {
            notif = " ";
          });
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MyKalkulatorHomePage())
          );
      } else {
        setState(() 
          {
            notif = " email atau password salah";
          });
      }
  }
  */

  @override
  Widget build(BuildContext context) {
    
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }
      return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child:SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 23,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(13, 49, 27, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login Title
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Sakkal Majalla',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              // Terms and Privacy Policy Text
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Sakkal Majalla',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'By signing in you are agreeing our ',
                        style: TextStyle(
                          color: Color.fromRGBO(107, 94, 94, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Term and privacy polic',
                        style: TextStyle(
                          color: Color.fromRGBO(3, 134, 208, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'y',
                        style: TextStyle(
                          color: Color.fromRGBO(3, 134, 208, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Email Field
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 47, left: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/mail.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(166, 166, 166, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Sakkal Majalla',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Password Field
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 48, left: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/lock.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(166, 166, 166, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Sakkal Majalla',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Remember Password and Forget Password
              Container(
                margin: const EdgeInsets.only(top: 39),
                width: 321,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Password Checkbox
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberPassword = !_rememberPassword;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: const Color.fromRGBO(212, 197, 197, 1),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color.fromRGBO(250, 250, 250, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: _rememberPassword
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Color.fromRGBO(3, 134, 208, 1),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          'Remember password',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 94, 94, 1),
                            fontSize: 21,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    // Forget Password Link
                    const Text(
                      'Forget password',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 134, 208, 1),
                        fontSize: 21,
                        fontFamily: 'Sakkal Majalla',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              

              // Login Button
              Container(
                margin: const EdgeInsets.only(top: 37),
                width: 326,
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  /*onPressed: () => login(_emailController.text.toString(),
                  _passwordController.text.toString()),*/
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(3, 134, 208, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 4,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Sakkal Majalla',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
              ),
            const SizedBox(
              height: 20,
            ),
            /*
            Text(notif,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              ),
            ),
            */
              // Or Connect With Section
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/img3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        const Text(
                          'or connect with',
                          style: TextStyle(
                            color: Color.fromRGBO(116, 112, 112, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(229),
                          child: Image.asset(
                           'assets/images/gg.png',
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
    /*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Log In to Your Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
              controller: emailController,
              validator: validateEmail,
              decoration: InputDecoration(hintText: "Enter Email")),  
              ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(hintText: "Enter Password")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => login(emailController.text.toString(),
                  passwordController.text.toString()),
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(notif,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}