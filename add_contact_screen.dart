import 'package:flutter/material.dart';
import '../models/contact.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List<String> images = [
    'assets/images/Leo_Messi.png',
    'assets/images/GOAT.png',
    'assets/images/El_balf.png',
    'assets/images/mm.png',
  ];

  String selectedImage = 'assets/images/Leo_Messi.png';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 12,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFFFF1D4),
        size: 20,
      ),
      filled: true,
      fillColor: const Color(0xFF29384D),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white70,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFFFF1D4),
          width: 2,
        ),
      ),
    );
  }

  void saveContact() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    final contact = Contact(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      imagePath: selectedImage,
    );

    Navigator.pop(context, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29384D),
        elevation: 0,
        title: const Text(
          'Route',
          style: TextStyle(
            color: Color(0xFFFFF1D4),
            fontSize: 28,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Selected image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                selectedImage,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Images
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  final image = images[index];
                  final isSelected = selectedImage == image;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = image;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFFFF1D4)
                              : Colors.transparent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // Name
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: fieldDecoration(
                'Enter User Name',
                Icons.person,
              ),
            ),

            const SizedBox(height: 12),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: fieldDecoration(
                'Enter User Email',
                Icons.email,
              ),
            ),

            const SizedBox(height: 12),

            // Phone
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: fieldDecoration(
                'Enter User Phone',
                Icons.phone,
              ),
            ),

            const SizedBox(height: 28),

            // Save button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: saveContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF1D4),
                  foregroundColor: const Color(0xFF29384D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Enter user',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}