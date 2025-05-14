import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Material UI Showcase',
  theme: ThemeData(primarySwatch: Colors.teal), // Define Material theme
  home: MaterialShowcaseApp(),
));

class MaterialShowcaseApp extends StatefulWidget {
  @override
  _MaterialShowcaseAppState createState() => _MaterialShowcaseAppState();
}

class _MaterialShowcaseAppState extends State<MaterialShowcaseApp> {
  int _selectedIndex = 0; // Keeps track of which page is selected (Home or Form)

  final List<Widget> _pages = <Widget>[
    HomePage(), // Page 0: Home with cards and list
    FormPage(), // Page 1: Form with input field
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index); // Change selected page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material UI Showcase'), // Top app bar title
      ),

      // Side navigation drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Navigation', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: Colors.teal), // Header background
            ),
            // Home navigation tile
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => _onItemTapped(0),
            ),
            // Form navigation tile
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Form'),
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),

      // Body of the page, changes based on selected index
      body: _pages[_selectedIndex],

      // Floating Action Button at the bottom right
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('FAB Pressed!')), // Show message when clicked
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Tap handler
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Form'),
        ],
      ),
    );
  }
}

// HomePage displays a scrollable list of cards
class HomePage extends StatelessWidget {
  final List<String> entries = List<String>.generate(5, (i) => "Item ${i + 1}"); // Sample items

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: entries.map((entry) {
        return Card(
          elevation: 4, // Shadow depth
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.label), // Icon on the left
            title: Text(entry), // Main text
            subtitle: Text('Subtitle for $entry'), // Smaller text below
            trailing: Icon(Icons.arrow_forward), // Icon on the right
            onTap: () {}, // Tap action (can be expanded)
          ),
        );
      }).toList(),
    );
  }
}

// FormPage displays a simple form with input and submit button
class FormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Key to validate the form
  final _controller = TextEditingController(); // Controller for the input field

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16), // Padding around the form
      child: Form(
        key: _formKey, // Attach key to form
        child: Column(
          children: [
            Text(
              'Enter something:',
              style: Theme.of(context).textTheme.headlineLarge, // Styled title
            ),
            SizedBox(height: 16), // Spacing

            // Input text field
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Input',
                border: OutlineInputBorder(), // Boxed border
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter text' // Simple validation
                  : null,
            ),
            SizedBox(height: 16),

            // Submit button
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If valid, show a SnackBar message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Submitted: ${_controller.text}')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}