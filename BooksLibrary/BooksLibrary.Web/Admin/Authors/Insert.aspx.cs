using BooksLibrary.Data;
using BooksLibrary.Models;
using ChatSystem.Data.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksLibrary.Web.Admin.Authors
{
    public partial class Insert : System.Web.UI.Page
    {
        private IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateAuthor_Click(object sender, EventArgs e)
        {
            var author = new Author
            {
                Name = this.AuthorNameInput.Text,
                Info = this.AuthorInfoInput.Text
            };

            if (this.AuthorImageInput.HasFile)
            {
                var fileName = Guid.NewGuid();
                var ext = this.AuthorImageInput.FileName.Substring(this.AuthorImageInput.FileName.LastIndexOf("."));

                var saveToPath = "~/Uploads/authorImages/" + fileName + ext;
                this.AuthorImageInput.SaveAs(MapPath(saveToPath));
                author.ImageUrl = saveToPath;
            }

            try
            {
                this.authors.Add(author);
                this.authors.SaveChanges();
                Response.Redirect("/admin/Authors/Details?id=" + author.Id);
            }
            catch (Exception ex)
            {
                // Handle error
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/authors/all");
        }
    }
}