using BooksLibrary.Models;
using ChatSystem.Data.Repository;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            this.users = new EfGenericRepository<User>(new Data.BooksLibraryDbContext());
            this.BindBooks();
        }

        private void BindBooks()
        {
            var myBooks = this.users.GetById(this.User.Identity.GetUserId()).Books;
            //var books = new List<Book>();
            //books.Add(new Book()
            //{
            //    Title = "Pesho"
            //});

            this.RepeaterBooks.DataSource = myBooks;
            this.DataBind();

        }
    }
}