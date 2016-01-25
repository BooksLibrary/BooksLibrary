using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Books
{
    public partial class Details : System.Web.UI.Page
    {
        private IRepository<Book> books;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.books = new EfGenericRepository<Book>(new Data.BooksLibraryDbContext());
        }

        public Book BookDetailsView_GetItem()
        {

            var queryId = Request.QueryString["id"];

            var id = this.ParseId(queryId);

            if (id != null)
            {
                return this.books.All()
                    .FirstOrDefault(b => b.Id == id);
            }

            Response.Redirect("http://telerikacademy.com/");

            return null;
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