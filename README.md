# Book App 📚

This application is a simple Flutter-based app with three main screens and a sub-screen for book details. It demonstrates user authentication, book listing, author information, and a rating system. The app is built using Flutter and BLoC for state management, with navigation handled using go_router.

---

## 🔥 Features

### 1. **Authentication Screen**
- **Register Users:**
  - Input: Username, password, and confirm password.
  - Store JWT token securely using `shared_preferences` and `flutter_secure_storage`.
  - Maintain user's logged-in status.
  - Direct navigation to the Home Screen upon reopening the app if the user is authenticated.

---

### 2. **Home Screen**
- **List of Books**: 
  - Display a list of books with their author information and star ratings..
- **Search Functionality**: 
  - Search for books locally (no API required).
- **Shimmer Effect**:
  - Loading animations for a better user experience.

---

### 3. **Book Details Screen**
- **Detailed Book Info**: 
  - Show comprehensive details of a selected book.
- **Add Star Rating**: 
  - Use a bottom sheet to add ratings for books.
  - **JWT Token**: Pass as a Bearer token in headers.
  - Users can rate the same book multiple times.

---

### 4. **Authors Screen**
- **List of Authors**: 
  - Display all authors with their detailed information.

---

## 🛠️ Tech Stack

- **Flutter**: Cross-platform development.
- **BLoC**: State management.
- **go_router**: Navigation.
- **shared_preferences**: For JWT token storage.
- **Shimmer**: Loading animations for better UX.

---

 
## ✨ Acknowledgments

- This project provided a great opportunity to learn new technologies and enhance my Flutter development skills.

--- 
 

 

 

 
 

 

 
 

 
 
