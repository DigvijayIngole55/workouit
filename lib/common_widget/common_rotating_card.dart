import 'package:flutter/material.dart';

class CommonWorkoutRotatingCard extends StatelessWidget {
  final String title;
  final String duration;
  final String imageUrl;
  final String? type;
  final String? difficulty;

  const CommonWorkoutRotatingCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.imageUrl,
    this.type,
    this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: EdgeInsets.only(right: 0),
      child: Card(
        color: Color(0xFF2D2D2D), // Dark Gray background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150, // Fixed height for the image
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Duration: $duration',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300], // Light Gray text
                    ),
                  ),
                  if (type != null) SizedBox(height: 5),
                  if (type != null)
                    Text(
                      'Type: $type',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[300], // Light Gray text
                      ),
                    ),
                  if (difficulty != null) SizedBox(height: 5),
                  if (difficulty != null)
                    Text(
                      'Difficulty: $difficulty',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[300], // Light Gray text
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
