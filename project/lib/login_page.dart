import 'package:college_app/main_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPressed = false;
  final String imageUrl = 'assets/images/nits_logo1.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('NIT Silchar', style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage(imageUrl),
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30,),
                SizedBox(width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter your Email',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: 'Enter your Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity, height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressed
                          ? Colors.blue.shade700
                          : Theme.of(context).colorScheme.primary, 
                    ),
                    onPressed: (){
                        setState(() {
                          isPressed = true;
                       
                        });
                    Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: 
                    (context )=> const MainScreen()));
                  }, child: Text('Login', style: Theme.of(context).textTheme.bodyMedium)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}