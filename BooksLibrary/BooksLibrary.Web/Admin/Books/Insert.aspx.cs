using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Error_Handler_Control;
using System.Data.Entity.Validation;

namespace BooksLibrary.Web.Admin.Books
{
    public partial class Insert : System.Web.UI.Page
    {
        IRepository<Book> books = new EfGenericRepository<Book>(new BooksLibraryDbContext());
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());
        IRepository<Category> categories = new EfGenericRepository<Category>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Author> GetAuthors()
        {
            return this.authors.All();
        }

        public IQueryable<Category> GetCategories()
        {
            return this.categories.All();
        }


        protected void AddBook(object sender, EventArgs e)
        {
            try
            {
                var book = new Book
                {
                    Title = this.TitleInput.Value,
                    Description = this.DescriptionInput.Value,
                    AuthorId = int.Parse(this.BookAuthorInput.SelectedValue),
                    CategoryId = int.Parse(CategoryInput.SelectedValue),
                    DateAdded = DateTime.Now
                };

                if (this.FileInput.HasFile)
                {
                    var fileName = Guid.NewGuid();
                    var extension = this.FileInput.FileName.Substring(this.FileInput.FileName.LastIndexOf("."));
                    var saveToPath = "~/Uploads/books/" + fileName + extension;
                    this.FileInput.SaveAs(MapPath(saveToPath));
                    book.FileUrl = saveToPath;
                }

                this.books.Add(book);
                this.books.SaveChanges();
                ErrorSuccessNotifier.AddSuccessMessage("Book successfully added!");
                Response.Redirect("/books/details?id=" + book.Id);
                return;
            }
            catch (DbEntityValidationException ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex.Message);
            }
        }

        public void Cancel(object sender, EventArgs e)
        {
            this.Response.Redirect("/admin/books/all");
        }
    }
}