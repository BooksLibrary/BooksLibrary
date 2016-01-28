namespace BooksLibrary.Web.Books
{
    using System;
    using System.Linq;
    using System.Collections.Generic;

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

        public List<Book> BooksListView_GetData(string sortByExpression, int startRowIndex, int maximumRows, out int totalRowCount)
        {
            var category = Request.QueryString["category"];
            var title = Request.QueryString["title"];
            var queryAuthorId = Request.QueryString["author"];

            var booksToReturn = this.books.All();

            if (category != null)
            {
                booksToReturn = booksToReturn.Where(b => b.Category.Name == category);
            }

            if (title != null)
            {
                booksToReturn = booksToReturn.Where(b => b.Title.Contains(title));
            }

            if (queryAuthorId != null)
            {
                int authorId;
                var isInteger = int.TryParse(queryAuthorId, out authorId);

                if (isInteger)
                {
                    booksToReturn = booksToReturn.Where(b => b.Author.Id == authorId);
                }
            }

            totalRowCount = booksToReturn.Count();

            switch (sortByExpression)
            {
                case "Title": booksToReturn = booksToReturn.OrderBy(b => b.Title); break;
                case "DateAdded": booksToReturn = booksToReturn.OrderBy(b => b.DateAdded); break;

                default: booksToReturn = booksToReturn.OrderBy(b => b.Id); break;
            }

            booksToReturn = booksToReturn
                .Skip(startRowIndex)
                .Take(maximumRows);


            return booksToReturn.ToList();
        }

        protected void Filter(object sender, EventArgs e)
        {
            var bookTitle = (this.BooksListView.FindControl("tbFilter") as TextBox).Text;
            Response.Redirect(RedirectUrl + "?title=" + bookTitle);
        }
    }
}