using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
namespace BooksLibrary.Web.Authors
{
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class All : System.Web.UI.Page
    {
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {
            var qp = Request.QueryString["id"];
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Author> AuthorsGridView_GetData()
        {
            return authors.All();
        }

        protected void AuthorsGridView_PageIndexChanged(object sender, EventArgs e)
        {
            var page = AuthorsGridView.PageIndex;
            var pageSize = AuthorsGridView.PageSize;
        }
    }
}