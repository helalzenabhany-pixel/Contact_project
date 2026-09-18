
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'add_contact_screen.dart';
import '../models/contact.dart';
import '../contact_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = [];

  Future<void> addContact() async {
    final Contact? newContact = await Navigator.push<Contact>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddContactScreen(),
      ),
    );

    if (newContact != null) {
      setState(() {
        contacts.add(newContact);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),

      appBar: AppBar(
        backgroundColor: const Color(0xFF29384D),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Route',
          style: TextStyle(
            color: Color(0xFFFFF1D4),
            fontSize: 28,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),

      body: contacts.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/message.json',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 10),
            const Text(
              'There is No Contacts Added Here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: contacts.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFFFFF1D4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(
                      contacts[index].imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      contacts[index].name,
                      style: const TextStyle(
                        color: Color(0xFF29384D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      contacts[index].email,
                      style: const TextStyle(
                        color: Color(0xFF29384D),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 5),

                    Text(
                      contacts[index].phone,
                      style: const TextStyle(
                        color: Color(0xFF29384D),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          contacts.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFF1D4),
        onPressed: addContact,
        child: const Icon(
          Icons.add,
          color: Color(0xFF29384D),
          size: 30,
        ),
      ),
    );
  }
}