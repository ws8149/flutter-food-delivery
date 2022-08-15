# Flutter Recipe App 

An assessment project for the demonstration of my technical knowledge of the Flutter framework. It also served as an opportunity for me to learn BLoC architecture as I had no knowledge of it prior to this project.

## Project Description
This Recipe app allows users to view recipes from MealDB. There is also a basic unit test included with this project.

The base logic of the application uses BloC to achieve separation of concerns. This app can be further improved by adding widget tests and a caching mechanism for API responses.

There was one area of concern which was the separation of DrinkHomePage and FoodHomePage. Initially, they both shared the same page but I found it to be cleaner once its separated. 

## How to Run The Project
1. Clone this repository and open the folder with Android Studio or any Flutter IDE of your choice.
2. Ensure an ios / android device or simulator is installed on your PC.
3. Run the app with the following command:
   `flutter run`

## How to Run The Tests
1. Run the command below:
   `flutter test unit_test.dart`