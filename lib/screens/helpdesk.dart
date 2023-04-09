import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({super.key});

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade300,
        title: Text("Help Desk",style: TextStyle(color: Colors.black87),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Padding(
           padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.white70,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70
                ),
                height: height *0.28,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                              
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("Customer Care Details",style: TextStyle(fontSize: 27,fontFamily: 'BODONIB',color: Colors.black,letterSpacing: 1.2),)),
                                
                              ],
                            ),
                            SizedBox(
                              height: height * 0.045,
                            ),
                            Row(
                              children: [
                                Text("Mobile Number : ",style: TextStyle(fontSize: 18,color: Colors.grey.shade700,letterSpacing: 0.6),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: width * 0.15,),
                                TextButton(onPressed: () async {
                                  await launchUrl(Uri.parse('tel:+919998224554'),mode: LaunchMode.externalApplication);
                                } , 
                                child: Text("9998224554",style: TextStyle(fontSize: 18,color: Colors.grey.shade700,letterSpacing: 0.6),),
                                // SizedBox(width: width * 0.2,),
                                ),
                                SizedBox(width: width * 0.2,),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(children: [
                              Text("Email I'D : ",style: TextStyle(fontSize: 18,color: Colors.grey.shade700,letterSpacing: 0.6),),
                            ],),
                            Row(
                              children: [
                                SizedBox(width: width * 0.15,),
                                TextButton(onPressed: () async {
                                  await launchUrl(Uri.parse('mailto:rajmodi2977@gmail.com'),mode: LaunchMode.externalApplication);
                                } , 
                                child: Text("rajmodi2977@gmail.com",style: TextStyle(fontSize: 18,color: Colors.grey.shade700,letterSpacing: 0.6),),
                                // SizedBox(width: width * 0.2,),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height : height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber,width: 2),
                  borderRadius: BorderRadius.circular(20)
                ),
                height: height * 0.14,
                width: width * 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Feedback",style: TextStyle(fontSize: 27,fontFamily: 'BODONIB',color: Colors.black,letterSpacing: 1.2))
                        ],
                      ),
                      SizedBox(height: height * 0.01,),
                      // Text("https://forms.gle/5vc4AUR27N8Lza9t7")
                      TextButton(onPressed: () async {
                        await launchUrl(Uri.parse('https://forms.gle/5vc4AUR27N8Lza9t7'),mode: LaunchMode.externalApplication);
                      }, child: Text("Submit feedback "))
                    ],
                  ),
                ),
              )
      /*        Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10)
                // ),
                height: MediaQuery.of(context).size.height * 0.27,
                width: double.infinity * 0.5,
                color: Colors.white70,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Customer Care Details",style: TextStyle(fontSize: 30,fontFamily: 'BODONIB',color: Colors.black,letterSpacing: 1.2),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
                            Text("\nMobile No. : 9998224554",style: TextStyle(fontSize: 18,color: Colors.grey.shade500,letterSpacing: 0.6),),
                            Text("\nEmail I'D : rajmodi2977@gmail.com",style: TextStyle(fontSize: 18,color: Colors.grey.shade500,letterSpacing: 0.6),),
                            // Text("\n",style: TextStyle(fontSize: 25,color: Colors.grey.shade500,letterSpacing: 2),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              // Container(height: MediaQuery.of(context).size.height * 0.05,color: Colors.amber,),
              
              Container(
                height: MediaQuery.of(context).size.height * 0.056,
                width: double.infinity * 0.5,
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("F A Q ",style: TextStyle(fontSize: 25,color: Colors.black87,letterSpacing: 2),),
                          SizedBox(
                            height: 35,
                            child: Image.network("https://static.vecteezy.com/system/resources/previews/010/042/733/original/faq-icon-transparent-illustration-clean-and-modern-illustration-for-a-website-or-mobile-applications-isolated-in-white-background-best-used-for-frequently-asked-question-icon-free-vector.jpg"),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 35
                            ),
                            onTap: () {
                              setState(() {
                                FAQTapDown;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              /*
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity * 0.5,
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("F A Q ",style: TextStyle(fontSize: 25,color: Colors.black87,letterSpacing: 2),),
                          SizedBox(
                            height: 30,
                            child: Image.network("https://static.vecteezy.com/system/resources/previews/010/042/733/original/faq-icon-transparent-illustration-clean-and-modern-illustration-for-a-website-or-mobile-applications-isolated-in-white-background-best-used-for-frequently-asked-question-icon-free-vector.jpg"),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.black,size: 35),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              */
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity * 0.5,
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                ),
              ),
      */      ],
          ),
        ),
      ]),
    );
  }
}

// void Faqtapdown (){
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
//             Text("\nMobile No. : 9998224554",style: TextStyle(fontSize: 18,color: Colors.grey.shade500,letterSpacing: 0.6),),
//             Text("\nEmail I'D : rajmodi2977@gmail.com",style: TextStyle(fontSize: 18,color: Colors.grey.shade500,letterSpacing: 0.6),),
//             // Text("\n",style: TextStyle(fontSize: 25,color: Colors.grey.shade500,letterSpacing: 2),),
//           ],
//         )
//       ],
//     );
//   }
// }