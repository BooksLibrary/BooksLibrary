using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using Error_Handler_Control;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Account
{
    public partial class MyLib : System.Web.UI.Page
    {
        private IRepository<User> users;
        private IRepository<Book> books;

        protected void Page_Load(object sender, EventArgs e)
        {
            var dbContext = new BooksLibraryDbContext();
            this.users = new EfGenericRepository<User>(dbContext);
            this.books = new EfGenericRepository<Book>(dbContext);
            this.BindBooks();
        }

        protected void RemoveFromMyLib(object sender, CommandEventArgs e)
        {
            var bookId = int.Parse(e.CommandArgument.ToString());
            var currentUser = this.users.GetById(this.User.Identity.GetUserId());

            var bookToRemove = currentUser.Books.FirstOrDefault(b => b.Id == bookId);

            if (bookToRemove != null)
            {
                currentUser.Books.Remove(bookToRemove);
                this.users.SaveChanges();

                ErrorSuccessNotifier.AddSuccessMessage("The book was removed successfully");
                this.BindBooks();
            }
        }

        private void BindBooks()
        {
            var myBooks = this.users.GetById(this.User.Identity.GetUserId()).Books;

            this.RepeaterBooks.DataSource = myBooks;
            this.DataBind();

        }
    }
}