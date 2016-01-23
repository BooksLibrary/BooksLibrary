using BooksLibrary.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Account
{
    public partial class ManagePersonalInfo : System.Web.UI.Page
    {
        private ApplicationUserManager manager;
        private User currentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            this.currentUser = manager.FindByIdAsync(User.Identity.GetUserId()).Result;

            if (this.currentUser == null)
            {
                Response.Redirect("/Account/Login");
            }

            this.firstName.Attributes.Add("placeholder", currentUser.FirstName);
            this.lastName.Attributes.Add("placeholder", currentUser.LastName);
            //this.firstName.Text = currentUser.FirstName;
            //this.lastName.Text = currentUser.LastName;
        }

        protected void UpdatePersonalInfo(object sender, EventArgs e)
        {

            if (this.currentUser == null)
            {
                Response.Redirect("/Account/Login");
            }

            if (this.firstName.Text.Length > 0)
            {
                currentUser.FirstName = this.firstName.Text;
            }

            if (this.lastName.Text.Length > 0)
            {
                currentUser.LastName = this.lastName.Text;
            }


            manager.UpdateAsync(currentUser).Wait();
            Response.Redirect("/Account/Manage");
        }
    }
}