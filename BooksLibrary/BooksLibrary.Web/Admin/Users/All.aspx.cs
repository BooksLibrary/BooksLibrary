using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using Error_Handler_Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Admin.Users
{
    public partial class All : System.Web.UI.Page
    {
        private IRepository<User> users = new EfGenericRepository<User>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<User> UsersListView_GetData()
        {
            return this.users.All();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void UsersListView_DeleteItem(object sender, EventArgs e)
        {
            var id = (sender as Button).CommandArgument;
            try
            {
                this.users.Delete(id);
                this.users.SaveChanges();
                ErrorSuccessNotifier.AddSuccessMessage("User deleted.");
                this.DataBind();
            }
            catch (Exception ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex.Message);
            }
        }
    }
}