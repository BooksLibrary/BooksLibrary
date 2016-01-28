using BooksLibrary.Data;
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
    public partial class ReadBook : System.Web.UI.Page
    {
        private IRepository<User> users;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.users = new EfGenericRepository<User>(new BooksLibraryDbContext());

            var queryId = Request.QueryString["id"];

            var bookId = this.ParseId(queryId);

            if (bookId == null)
            {
                Response.Redirect("~/ErrorPages/NotFound.aspx");
            }

            var bookToRead = this.users.GetById(this.User.Identity.GetUserId())
                .Books.FirstOrDefault(b => b.Id == bookId);

            if (bookToRead == null)
            {
                Response.Redirect("~/ErrorPages/NotFound.aspx");
            }

            else
            {
                this.bookContainer.Src = bookToRead.FileUrl;
            }
        }

        private int? ParseId(string queryId)
        {
            if (queryId == null)
            {
                return null;
            }

            int id;

            var isInteger = int.TryParse(queryId, out id);

            if (!isInteger)
            {
                return null;
            }

            return id;
        }
    }
}