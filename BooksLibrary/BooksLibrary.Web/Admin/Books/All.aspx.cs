using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Admin.Books
{
    public partial class All : System.Web.UI.Page
    {
        IRepository<Book> books = new EfGenericRepository<Book>(new BooksLibraryDbContext());
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());
        IRepository<Category> categories = new EfGenericRepository<Category>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Book> BooksListView_GetData()
        {
            return this.books.All();
        }

        public string GetFileUrl(Book book)
        {
            if (book.FileUrl == null) return "#";

            return book.FileUrl;
        }

        public IQueryable<Author> GetAuthors()
        {
            return this.authors.All();
        }

        public IQueryable<Category> GetCategories()
        {
            return this.categories.All();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void BooksListView_UpdateItem(int id)
        {
            Book item = this.books.GetById(id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.books.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void BooksListView_DeleteItem(int id)
        {
            Book book = this.books.GetById(id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (book == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            if (ModelState.IsValid)
            {
                this.books.Delete(book);
                this.books.SaveChanges();
            }
        }

        protected void BooksListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {

        }
    }
}