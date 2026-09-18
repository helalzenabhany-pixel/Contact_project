import 'package:flutter/material.dart';
import 'models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFF1D4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                contact.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              contact.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF29384D),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Color(0xFF29384D),
                  size: 18,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    contact.email,
                    style: const TextStyle(
                      color: Color(0xFF29384D),
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Color(0xFF29384D),
                  size: 18,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    contact.phone,
                    style: const TextStyle(
                      color: Color(0xFF29384D),
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const Spacer(),

            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}