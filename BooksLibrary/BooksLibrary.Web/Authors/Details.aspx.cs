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
    public partial class Details1 : System.Web.UI.Page
    {
        IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Author AuthorDetailsView_GetItem()
        {
            var idAsString = this.Request.QueryString["id"];
            if (idAsString == null) return null;
            int id;
            if (int.TryParse(idAsString, out id))
            {
                return this.authors.GetById(id);
            }

            return null;
        }
    }
}