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
        private const string RedirectUrl = "/Books/All";
        private IRepository<Book> books;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.books = new EfGenericRepository<Book>(new BooksLibraryDbContext());
        }

        public IQueryable<Book> BooksListView_GetData()
        {
            var category = Request.QueryString["category"];
            var title = Request.QueryString["title"];

            var booksToReturn = this.books.All();

            if (category != null)
            {
                booksToReturn = booksToReturn.Where(b => b.Category.Name == category);
                //return this.books.All().Where(b => b.Category.Name == category);
            }

            if (title != null)
            {
                booksToReturn = booksToReturn.Where(b => b.Title.Contains(title));
            }

            return booksToReturn;
        }

        protected void Filter(object sender, EventArgs e)
        {
            var bookTitle = (this.BooksListView.FindControl("tbFilter") as TextBox).Text;
            Response.Redirect(RedirectUrl + "?title=" + bookTitle);
        }
    }
}