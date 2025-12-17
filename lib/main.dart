// Import Flutter's material design library
import 'package:flutter/material.dart';

// Entry point of the app
void main() {
  runApp(const MyApp());
}

// Root widget - wraps the entire app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloFlutterPage(),
    );
  }
}

// Main page widget that can change (has state)
class HelloFlutterPage extends StatefulWidget {
  const HelloFlutterPage({super.key});

  @override
  State<HelloFlutterPage> createState() => _HelloFlutterPageState();
}

// State class - holds data and logic for HelloFlutterPage
class _HelloFlutterPageState extends State<HelloFlutterPage> {
  // State variables
  String text = "Hello Flutter!";
  bool changed = false;

  // Method to update the text when button is pressed
  void changeText() {
    setState(() {
      if (changed) {
        text = "Hello Flutter!";
      } else {
        text = "Flutter is interactive!";
      }
      changed = !changed;
    });
  }

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top app bar
      appBar: AppBar(
        title: const Text("Hello Flutter App")
      ),
      
      // Main content
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display text with dynamic styling
            Text(
              text,
              style: TextStyle(
                fontSize: changed ? 32 : 24,
                color: changed ? Colors.blue : Colors.black,
              ),
            ),
            
            // Add spacing
            const SizedBox(height: 20),
            
            // Button to trigger text change
            ElevatedButton(
              onPressed: changeText,
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================================
// FLUTTER & DART FUNDAMENTALS EXPLAINED
// ============================================================================

// -----------------------------
// 1. WHAT IS A CLASS?
// -----------------------------
// A class is a blueprint for creating objects. It groups data and functions together.
// Syntax: class ClassName extends ParentClass { }
// Example: class MyApp extends StatelessWidget { }
// - "class" is the keyword
// - "MyApp" is your class name (use PascalCase)
// - "extends" means inherit from another class
// - StatelessWidget is the parent class we're inheriting from

// -----------------------------
// 2. WHAT IS A WIDGET?
// -----------------------------
// In Flutter, EVERYTHING is a widget. Widgets are the building blocks of your UI.
// Examples: Text, Button, Container, Column, Row, Image, etc.
// 
// Two main types:
// - StatelessWidget: Never changes (static content)
// - StatefulWidget: Can change over time (dynamic content)

// -----------------------------
// 3. CONSTRUCTORS
// -----------------------------
// A constructor is a special function that creates an instance of a class.
// Syntax: const ClassName({super.key});
// - "const" makes it immutable (better performance)
// - {super.key} is an optional parameter for widget identification
// - "super.key" passes the key to the parent class

// -----------------------------
// 4. THE build() METHOD
// -----------------------------
// The build() method is THE MOST IMPORTANT method in widgets.
// It describes what the widget looks like (returns the UI).
// Syntax: Widget build(BuildContext context) { return SomeWidget(); }
// - Must return a Widget
// - Gets called whenever the widget needs to redraw
// - BuildContext knows where this widget is in the widget tree

// -----------------------------
// 5. STATEFUL WIDGETS (Two Parts)
// -----------------------------
// Part 1: The widget class (immutable)
//   - Extends StatefulWidget
//   - Has createState() method
//
// Part 2: The state class (mutable)
//   - Extends State<YourWidget>
//   - Holds variables that can change
//   - Has the build() method
//   - Underscore (_) makes it private to this file

// -----------------------------
// 6. setState() - CRITICAL!
// -----------------------------
// setState() tells Flutter: "Data changed, rebuild the UI!"
// RULE: Always wrap state changes inside setState() { }
// Syntax: setState(() { variable = newValue; });
// Without setState(), the UI won't update even if variables change.

// -----------------------------
// 7. DART SYNTAX BASICS
// -----------------------------
// Variables: Type name = value;
//   - String text = "Hello";
//   - int age = 25;
//   - bool isActive = true;
//
// Arrow function: => is shorthand for { return ... }
//   - State<Widget> createState() => _StateClass();
//   - Same as: State<Widget> createState() { return _StateClass(); }
//
// Ternary operator: condition ? ifTrue : ifFalse
//   - fontSize: changed ? 32 : 24
//   - "If changed is true, use 32, otherwise use 24"

// -----------------------------
// 8. PARAMETERS IN FLUTTER
// -----------------------------
// Named parameters: Use the parameter name with colon
//   - Text("Hello", style: TextStyle(...))
//   - SizedBox(height: 20, width: 100)
//
// child vs children:
//   - "child": Takes ONE widget (Center, Container)
//   - "children": Takes a LIST of widgets [Widget1(), Widget2()]

// -----------------------------
// 9. COMMON WIDGETS
// -----------------------------
// MaterialApp: Wraps entire app, provides Material Design
// Scaffold: Basic page structure (app bar, body, etc.)
// AppBar: Top navigation bar
// Center: Centers its child widget
// Column: Arranges children vertically
// Row: Arranges children horizontally
// Text: Displays text
// ElevatedButton: Material Design button
// SizedBox: Creates empty space
// Container: Box model widget (padding, margin, etc.)

// -----------------------------
// 10. HOW THIS APP WORKS
// -----------------------------
// 1. main() runs and calls runApp(MyApp())
// 2. MyApp builds and returns MaterialApp with HelloFlutterPage as home
// 3. HelloFlutterPage creates _HelloFlutterPageState
// 4. _HelloFlutterPageState builds the UI (Scaffold with text and button)
// 5. When button is pressed, changeText() is called
// 6. changeText() calls setState() which updates variables
// 7. setState() triggers rebuild of the UI with new values
// 8. Text widget shows updated content with new styling