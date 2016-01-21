namespace BooksLibrary.Data
{
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
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
