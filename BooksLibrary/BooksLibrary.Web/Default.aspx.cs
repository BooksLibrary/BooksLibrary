using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web
{
    public partial class _Default : Page
    {
        IRepository<Book> books = new EfGenericRepository<Book>(new BooksLibraryDbContext());
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Cache["topAuthors"] == null)
            {
                Cache.Insert("topAuthors", GetTopAuthors(), null, DateTime.Now.AddSeconds(120), TimeSpan.Zero);
            }

            if (Cache["newestBooks"] == null)
            {
                Cache.Insert("newestBooks", GetNewestBooks(), null, DateTime.Now.AddSeconds(120), TimeSpan.Zero);
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Book> NewestBooksListVIew_GetData()
        {
            return Cache.Get("newestBooks") as List<Book>;
        }

        protected void BookDetailsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/books/details?id=" + (sender as Button).CommandArgument);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Author> TopAuthorsListView_GetData()
        {
            return Cache.Get("topAuthors") as List<Author>;
        }

        protected void AuthorDetailsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/authors/details?id=" + (sender as Button).CommandArgument);
        }

        private List<Author> GetTopAuthors()
        {
            return authors.All()
                .OrderByDescending(a => a.Books.Count)
                .Take(10)
                .ToList();
        }

        private List<Book> GetNewestBooks()
        {
            return books.All()
                .OrderByDescending(b => b.DateAdded)
                .Take(10)
                .ToList();
        }
    }
}