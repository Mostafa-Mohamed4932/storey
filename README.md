# Bookstore Flutter Application

This Flutter application is designed to serve as a digital bookstore, allowing users to browse a selection of books and add them to their cart for purchase. The application is connected to a Google Sheets database, making it easy to manage and update the available inventory.

## Features

- *Home Screen*: Users can view a list of available books on the home screen.
- *Cart Functionality*: Users can add books to their cart for later purchase.
- *Google Sheets Integration*: The application is connected to a Google Sheets database, ensuring real-time updates to the inventory.
  
## Installation

1. Clone this repository to your local machine.
   
   
   git clone https://github.com/yourusername/bookstore-flutter.git
   

2. Navigate to the project directory.

   
   cd bookstore-flutter
   

3. Run the application on an emulator or a physical device.

   
   flutter run
   

## Configuration

Before running the application, you need to set up your Google Sheets database. Follow these steps:

1. Create a Google Sheets spreadsheet to store your book data.

2. Share the spreadsheet with the service account associated with your Flutter application.

3. Obtain the credentials JSON file from the Google Cloud Console and place it in the android/app directory of your Flutter project.

4. Update the pubspec.yaml file with the necessary dependencies for Google Sheets integration.

## Usage

Once the application is running, users can:

- Browse the list of available books on the home screen.
- Tap on a book to view more details.
- Add books to their cart by tapping on the "Add to Cart" button.
- View their cart by tapping on the cart icon.


## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (git checkout -b feature/myfeature).
3. Make your changes.
4. Commit your changes (git commit -am 'Add new feature').
5. Push to the branch (git push origin feature/myfeature).
6. Create a new pull request.

## License

This project is licensed under the [MIT License](LICENSE).
