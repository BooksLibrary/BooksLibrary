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

namespace BooksLibrary.Web.Authors
{
    public partial class Details : System.Web.UI.Page
    {
        private int id = 1;
        private IRepository<Author> authors = new EfGenericRepository<Author>(new BooksLibraryDbContext());

        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Request.QueryString["id"]);
            this.AuthorDetailsView.PageIndex = id;
        }

        protected IQueryable<Author> GetAuthors()
        {
            return this.authors.All();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object AuthorDetailsView_GetItem()
        {
            return this.authors.All()
                .FirstOrDefault(a => a.Id == this.id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void AuthorDetailsView_UpdateItem()
        {
            Author author = this.authors.All()
                .FirstOrDefault(a => a.Id == this.id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (author == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(author);
            if (ModelState.IsValid)
            {
                this.authors.SaveChanges();
            }
        }

        protected string GetImageUrl()
        {
            var author = this.authors.GetById(this.id);
            var existingFilePath = Server.MapPath(author.ImageUrl);

            if (File.Exists(existingFilePath))
            {
                return author.ImageUrl;
            }
            else
            {
                return "~/Uploads/authorImages/default.jpg";
            }
        }

        protected void FileUploadButton_Click(object sender, EventArgs e)
        {
            var author = this.authors.GetById(this.id);
            var control = this.AuthorDetailsView.FindControl("FileControl") as FileUpload;
            var fileName = control.FileName;
            var fileExtension = fileName.Substring(fileName.LastIndexOf("."));
            var existingFilePath = Server.MapPath(author.ImageUrl);

            if (control.HasFile)
            {
                if (author.ImageUrl != null && File.Exists(existingFilePath))
                {
                    File.Delete(existingFilePath);
                }

                var saveToPath = "~/Uploads/authorImages/" + Guid.NewGuid() + fileExtension;
                control.SaveAs(MapPath(saveToPath));
                author.ImageUrl = saveToPath;
                authors.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void AuthorDetailsView_DeleteItem(int id)
        {
            this.authors.Delete(id);
            this.authors.SaveChanges();
            this.Response.Redirect("/admin/authors/all");
        }
    }
}