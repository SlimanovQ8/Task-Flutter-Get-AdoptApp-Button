import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Adopt"),

      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Hi "),
              accountEmail: Text("Hi "),
              decoration: BoxDecoration(color: Color(0xff6894F0)),

              currentAccountPicture: new CircleAvatar(
                radius: 50.0,
                backgroundImage:
                AssetImage('assets/images/UserIcon.png') as ImageProvider,
              ),

            ),
            ListTile(
              leading: Icon(
                Icons.add,
              ),
              title: const Text('Sign Up'),
              onTap: () {
                setState(() {
                  context.push("/SignUp",);
                });

              },
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print("j");

                  setState(() {

                    Provider.of<PetsProvider>(context, listen: false)
                        .getsPets();
                  });

                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Get All pets"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print("j");

                  setState(() {
                    setState(() {
                      context.push("/AddPet" );
                    });

                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Pet"),
                ),
              ),
            ),
            FutureBuilder(
              future: Provider.of<PetsProvider>(context, listen: false)
                  .getsPets(),
                //context.read()<PetsProvider>().getsPets(),
              builder: (context, ss) {
                List<Pet> pets = Provider.of<PetsProvider>(context, listen: false).pets;

                if(ss.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height),
                      ),
                      physics: const NeverScrollableScrollPhysics(), // <- Here
                      itemCount: pets.length,
                      itemBuilder: (context, index) => PetCard(pet: pets[index]));

              }
              ),

          ],
        ),
      ),
    );
  }
}
