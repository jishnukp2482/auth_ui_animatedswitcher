import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: animatedswitchui(),
    debugShowCheckedModeBanner: false,
  ));
}

class animatedswitchui extends StatefulWidget {
  @override
  State<animatedswitchui> createState() => _animatedswitchuiState();
}

class _animatedswitchuiState extends State<animatedswitchui> {
  late bool formvisible;
  int? _formindex;
  @override
  void initState() {
    formvisible = false;
    _formindex = 1;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgimage.jpg"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.black54,
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight + 40,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Welcome to this awesome login app.\n You are awesome",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              formvisible = true;
                              _formindex = 1;
                            });
                          },
                          child: const Text("Login"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              formvisible = true;
                              _formindex = 2;
                            });
                          },
                          child: const Text("signup"),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey.withOpacity(.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.google),
                      label: const Text("Continue with google"),
                      
                      style: OutlinedButton.styleFrom(
                     
                          backgroundColor: Colors.transparent,
                          
                          shape: RoundedRectangleBorder(
                            
                            borderRadius: BorderRadius.circular(20),
                          )),
                          
                    ),
                  ),
                 SizedBox(height: 40,)
                ],
              ),
            ),
            AnimatedSwitcher(
              duration:const Duration(milliseconds: 200,),
              child: (!formvisible)?null 
              :Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            backgroundColor: _formindex==1?Colors.white:Colors.blue,
                          ),
                          
                          onPressed: (){
                          setState(() {
                            _formindex=1;
                          });
                        }, child: Text("Login",style: TextStyle(
                          color: _formindex==1 ? Colors.black :Colors.white,
                        ),)),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),),
                            backgroundColor: _formindex==2?Colors.white:Colors.blue,
                          ),
                          onPressed: (){
                          setState(() {
                            _formindex=2;
                          });
                        }, child: Text("Signup",style: TextStyle(
                          color: _formindex==2?Colors.black:Colors.white,
                        ),)),
                        const SizedBox(width: 10,),
                        IconButton(onPressed: (){
                          setState(() {
                          formvisible=false;  
                          });

                        }, icon: const Icon(Icons.clear),color: Colors.white,),
                        
                      ],
                    ),
                     Container(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _formindex == 1 ? loginform() : signupform()),
                         )
                  ],
                ),
              ) ),
           
          ],
        ),
      ),
    );
  }
}

class loginform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(2) ),
              hintText: "enter your email ",
              label: const Text("Username"),
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              hintText: "enter your password",
              label: const Text("password"),
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, 
          child: const Text("Login",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),),
          
        ],
      ),

    );
  }
}
class signupform extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.white,
    ),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(30),
      children: [
        TextField(
          decoration: InputDecoration(
            label: const Text("username"),
            hintText: "enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            )
          )
        ),
        const SizedBox(height: 10,),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            label: const Text("password"),
            
            hintText: "enter your password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            )
          ),
        ),
        const SizedBox(height: 10,),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            label: const Text("confirm password"),
            hintText: "confirm password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            )
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: (){},
         child: const Text("signup",style: TextStyle(color: Colors.white),),
         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
         
      ],
    ),
   );
  }

}