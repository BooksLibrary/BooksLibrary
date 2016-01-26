using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Authors
{
    public partial class All1 : System.Web.UI.Page
    {
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Author> AuthorsGridView_GetData()
        {
            return this.authors.All();
        }

        protected void AuthorsGridView_PageIndexChanged(object sender, EventArgs e)
        {
            var page = AuthorsGridView.PageIndex;
            var pageSize = AuthorsGridView.PageSize;
        }
    }
}