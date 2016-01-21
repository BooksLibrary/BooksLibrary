namespace BooksLibrary.Data
{
    using BooksLibrary.Models;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class BooksLibraryDbContext : IdentityDbContext<User>
    {
        public BooksLibraryDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static BooksLibraryDbContext Create()
        {
            return new BooksLibraryDbContext();
        }
    }
}
