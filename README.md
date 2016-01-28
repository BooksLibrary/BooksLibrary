# BooksLibrary
Teamwork for ASP.NET Web Forms course in Telerik Academy 2015/2016

**BooksLibrary** is a Asp.Net Web Forms Application that allow users to read the latest and most popular Programming books.

**Anonymous users** can review all books, authors and categories, sort them by Title, Creation Date, Category, etc. and search a book by its Title.

**Registered users** can make their own Library, add their favorite books and read them. With a **standart user account** a user can add up to 2 books in their library.Users can aswell remove a book from the library.7

**Admin users** can add, remove and update all books, categories and authors.

###Basic routes:
* / - The home page is showing the Top 10 Latest books and the Top 10 authors with the highest count books.
* /Books/All - showing all books with opportunity of sort by Title and sort by Date.
* /Books/All?title= - filter the books by title.
* /Books/ALl?author= - filter the books by authorId.
* /Books/All?category= - filter the books by category. 
* /Books/Details?id= - showing detailed information about a book like descriptiion, users comments, etc.
* /Books/MyLib - **require authentication** - showing the books in the user library with opportunity of remove and read each book.
* /Books/Read?id= - **require authentication** - showing the content of the book if the user is authenticated and the book is in his collection.
* /Authors/All - showing all authors with opportunity of sort by Author name and search an author by his name.
* /Categories/All - showing all categoies.
* /Account/Login - Login the user.
* /Account/Register - register a new user in the application.
* /Account/ManagePersonalInfo - **require authentication** - manage personal information about the user.
* /Account/ManagePassword - **require authentication** - manage user password.
* /Admin/Books/All - **require admin** - show all books with opportunity of edit or delete each one.
* /Admin/Books/Insert - **require admin** - add a new book in the application.
* /Admin/Authors/All - **require admin** - show all authors with opportunity of edit or delete each one.
* /Admin/Authors/Insert - **require admin** - add a new author in the application.
* /Admin/Categories/all - **require admin** - show all categories with opportunity of add, edit or delete each one.
