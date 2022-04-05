import 'package:flutter/material.dart';



class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
        {
          Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),color: Colors.white,),
        title: const Text(
          'Privacy And Terms',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            const [
              Text("Terms of Use"),
              SizedBox(height: 10,),
              Text("Welcome to DreamHouse. DreamHouse is a social platform connecting home owners and home professionals into a new world of home design."),
              SizedBox(height: 10,),
              Text("These terms of use sets forth the agreement between you and DreamHouse Ltd. It governs your use of the products and services we offer through our website and applications. This agreement provides important information to you, including information about your obligations about your content, our limitation of liability to you, and your agreement to resolve any disputes by individual arbitration and to waive the right to participate in a class action. By accessing DreamHouse you are agreeing to the following terms."),
              SizedBox(height: 10,),
              Text("DreamHouse may provide a translation of the english version of the terms of use into other languages. Any translation of the terms of use into other languages is for your own convenience only and the english version governs the terms of your relationship with DreamHouse. Furthermore, if there are any inconsistencies between the english version of the terms and any translation, the english version of the terms shall prevail."),
              SizedBox(height: 10,),
              Text("Using DreamHouse"),
              SizedBox(height: 10,),
              Text("Registration. Access to certain functionalities of the DreamHouse platform will require you to register with us. If you register with DreamHouse, you agree to provide us accurate information and update it as needed for accuracy. We treat personally identifiable information you provide as part of registration in accordance with our privacy policy. You may register on DreamHouse using a third-party service (e.g., Facebook); whereby you give us permission to access, store, and use your information from that service as permitted by that service and as may be described in our privacy policy. If you believe your account may have been compromised or misused, contact us immediately at DreamHouse customer support.Privacy Policy. You can access our privacy policy anytime through privacy policy. By accessing the DreamHouse platform, you agree to accept the privacy policy, regardless of whether you are a registered user."),
              SizedBox(height: 10,),
              Text("Profile for Professionals. If you are a professional services provider, you may set up a Professional Profile. If you do, you give us the right to list your Professional Profile in our directory of service providers, and you will be able to connect with others on the DreamHouse platform while identified by your professional profile. Your professional profile is subject to our professional profile policy."),
              SizedBox(height: 10,),
              Text("Termination. DreamHouse holds the absolute right at its own discretion to permanently or temporarily suspend your use of the site or the service at any time for any reason, without any notice or liability to you. We may terminate your account at any time for any or no reason, including if you violate any DreamHouse policy. Upon termination of your use of the service, certain provisions will survive termination.Acceptable Use"),
              SizedBox(height: 10,),
              Text("As part of DreamHouse’s terms of use policy, you agree not to use the information, services or any other part of the DreamHouse platform to take any action or actions that:"),
              SizedBox(height: 10,),
              Text("Are contrary to DreamHouse's public image, goodwill or reputation.Promote any illegal activity or content, including without limitation child or animal abuse, violence, illegal drug use, and underage drinking.Infringe on our or any third party's copyright, patent, trademark, trade secret or other proprietary rights or rights of publicity or privacy.Express or imply that any of your statements, activities or causes are endorsed by us, without our prior written consent in each instance.Violate any applicable law, statute, ordinance or regulation, or encourage any conduct that could constitute a criminal offense or give rise to civil liability.Are libelous, defamatory, threatening, harassing, invasive of privacy, abusive, tortious, hateful, discriminatory, pornographic or obscene."),
              SizedBox(height: 10,),
              Text("Transmit any trade secret or other material, non-public information about any person, company or entity without the authorization to do so.Restrict or inhibit any other visitor from using the DreamHouse platform, including, without limitation, by means of hacking or defacing any portion of the DreamHouse platform.Modify, adapt, sub-license, translate, sell, reverse engineer, decompile, or disassemble any portion of the DreamHouse platform.Remove any copyright, trademark, or other proprietary rights notices contained in the DreamHouse platform.Sublicense, sell, rent, lease, transfer, assign, or convey any rights under the terms to any third party, or otherwise commercially exploit or profit from the information or content of the DreamHouse platform, or any portion thereof, in any manner whatsoever, except as expressly permitted herein.any part of the DreamHouse platform without our prior written authorization.Distribute any virus, worm or other similar or deleterious files, scripts or programming routines.Interfere with or disrupt any services or equipment with the intent of causing an excessive or disproportionate load on the infrastructure of DreamHouse or its licensors or suppliers.Involve the preparation or distribution of junk mail, spam, chain letters, pyramid schemes, or other deceptive or unsolicited bulk or commercial email.Use any robot, spider, site search/retrieval application, or other manual or automatic device or process to retrieve, index, data mine the DreamHouse Platform or in any way reproduce or circumvent the navigational structure or presentation of the DreamHouse platform or its contents, authentication and security measures."),
              SizedBox(height: 10,),
              Text("Forget headers or otherwise manipulate identifiers in order to disguise the origin of any submission.Execute any form of network monitoring or run a network analyzer or packet sniffer or other technology to intercept, decode, mine or display any packets used to communicate between the DreamHouse platform's servers or any data not intended for you.Harvest or collect information about any DreamHouse platform visitors or members without their express consent; and/orContains any reference to or likeness of any identifiable third parties, unless consent has been obtained from all such individuals and their parent/legal guardian if they are under the age of majority in their jurisdiction of residence.Your Content"),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );

  }

}



