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
            //CategoriesListView.DataSource = categories.All().ToArray();
            //CategoriesListView.DataBind();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Category> CategoriesListView_GetData()
        {
            return categories.All();
        }

        public void CategoriesListView_InsertItem(Category category)
        {
            var item = category;
            categories.Add(category);
            if (ModelState.IsValid)
            {
                categories.SaveChanges();
            }
            else
            {
                ModelState.AddModelError("Error", "Invalid Category name");
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesListView_DeleteItem(int id)
        {
            var categoryToDelete = categories.All()
                .FirstOrDefault(c => c.Id == id);

            if (categoryToDelete == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            categories.Delete(categoryToDelete);
            categories.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoriesListView_UpdateItem(int id)
        {
            var item = categories.All()
                .FirstOrDefault(c => c.Id == id);

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
                categories.SaveChanges();
            }
            else
            {
                ModelState.AddModelError("", "Invalid category name");
            }
        }
    }
}