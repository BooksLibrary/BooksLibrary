using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Linq;

namespace BooksLibrary.Web.Categories
{
    public partial class All1 : System.Web.UI.Page
    {
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
        public IQueryable CategoriesListView_GetData()
        {
            return this.categories.All();
        }

        protected int GetNumberOfBooks(Category category)
        {
            return category.Books.Count;
        }
    }
}