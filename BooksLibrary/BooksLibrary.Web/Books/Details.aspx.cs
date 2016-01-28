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

namespace BooksLibrary.Web.Books
{
    public partial class Details : System.Web.UI.Page
    {
        private const int MaxBooksCount = 2;
        private const int PageSize = 4;
        private IRepository<Book> books;
        private IRepository<Comment> comments;
        private IRepository<User> users;

        protected void Page_Load(object sender, EventArgs e)
        {
            var dbContext = new BooksLibraryDbContext();
            this.books = new EfGenericRepository<Book>(dbContext);
            this.comments = new EfGenericRepository<Comment>(dbContext);
            this.users = new EfGenericRepository<User>(dbContext);
            this.BindComments(0);

            if (!this.User.Identity.IsAuthenticated)
            {
                this.addCommentContainer.Attributes.Add("style", "display:none");
            }

            //this.tbComment.Text = string.Empty;
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

            Response.Redirect("~/ErrorPages/NotFound.aspx");

            return null;
        }

        protected void AddBookToMyLib(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                ErrorSuccessNotifier.AddErrorMessage("You need to be authenticated to add books!");
                return;
            }

            var currentUser = this.users.GetById(this.User.Identity.GetUserId());

            if (currentUser.Books.Count >= MaxBooksCount)
            {
                ErrorSuccessNotifier.AddErrorMessage(string.Format("Cannot have more than {0} books in your library!", MaxBooksCount));
                return;
            }


            var queryId = Request.QueryString["id"];

            var id = this.ParseId(queryId);

            if (id == null)
            {
                Response.Redirect("~/ErrorPages/NotFound.aspx");
                return;
            }

            var bookToAdd = this.books.GetById(id);

            if (bookToAdd != null)
            {
                currentUser.Books.Add(bookToAdd);
                this.users.SaveChanges();
            }

            ErrorSuccessNotifier.AddSuccessMessage("The book was successfully added.");
            Response.Redirect("~/Books/MyLib.aspx");

        }

        protected void Next(object sender, EventArgs e)
        {
            var page = int.Parse(this.currentPage.Value);
            page = page + 1;

            this.currentPage.Value = page.ToString();
            this.BindComments(page);
        }

        protected void Prev(object sender, EventArgs e)
        {
            var page = int.Parse(this.currentPage.Value);

            if (page > 0)
            {
                page = page - 1;
            }

            this.currentPage.Value = page.ToString();
            this.BindComments(page);
        }

        protected void AddComment(object sender, EventArgs e)
        {
            if (!this.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            var commentText = this.tbComment.Text;

            if (string.IsNullOrEmpty(commentText))
            {
                // TODO: Notifier.error
                Response.Redirect(Request.RawUrl);
            }

            var queryId = Request.QueryString["id"];

            var id = int.Parse(queryId);

            var comment = new Comment();
            comment.Content = commentText;
            comment.UserId = this.User.Identity.GetUserId();
            comment.BookId = id;
            comment.Date = DateTime.Now;

            this.comments.Add(comment);
            this.comments.SaveChanges();
            this.tbComment.Text = string.Empty;
            Response.Redirect(Request.RawUrl);
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

        private void BindComments(int page)
        {
            var queryId = Request.QueryString["id"];

            var id = this.ParseId(queryId);

            var comments = this.comments
                    .All()
                    .Where(c => c.Book.Id == id)
                    .OrderByDescending(c => c.Date)
                    .Skip(PageSize * page)
                    .Take(PageSize)
                    .ToList();

            this.RepeaterComments.DataSource = comments;
            this.DataBind();

        }
    }
}