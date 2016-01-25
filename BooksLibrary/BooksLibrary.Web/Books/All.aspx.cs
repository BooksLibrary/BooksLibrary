namespace BooksLibrary.Web.Books
{
    using System;
    using System.Linq;

    using BooksLibrary.Data;
    using BooksLibrary.Models;
    using ChatSystem.Data.Repository;
    using System.Web.UI.WebControls;
    public partial class All : System.Web.UI.Page
    {
        private IRepository<Book> books;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.books = new EfGenericRepository<Book>(new BooksLibraryDbContext());
        }

        public IQueryable<Book> BooksListView_GetData()
        {
            var category = Request.QueryString["category"];

            if (category != null)
            {
                return this.books.All().Where(b => b.Category.Name == category);
            }

            return books.All();
        }
    }
}