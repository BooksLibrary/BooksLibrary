namespace BooksLibrary.Data
{
    using Models;
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

        public DbSet<Category> Categories { get; set; }

        public DbSet<Book> Books { get; set; }

        public DbSet<Comment> Comments { get; set; }

        public DbSet<Author> Authors { get; set; }

        public static BooksLibraryDbContext Create()
        {
            return new BooksLibraryDbContext();
        }
    }
}
