using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Categories
{
    public partial class All : System.Web.UI.Page
    {
        private IRepository<Category> categories = new EfGenericRepository<Category>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriesListView.DataSource = categories.All().ToArray();
            CategoriesListView.DataBind();
        }

        protected void CategoriesListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            CategoriesListView.EditIndex = e.NewEditIndex;
            CategoriesListView.DataSource = categories.All().ToArray();
            CategoriesListView.DataBind();
        }

        protected void CategoriesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {

        }

        protected void CategoriesListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            categories.SaveChanges();
        }
    }
}