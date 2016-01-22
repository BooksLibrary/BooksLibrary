namespace BooksLibrary.Data.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Models;
    using System;
    using System.Data.Entity.Migrations;
    using System.Linq;
    public sealed class Configuration : DbMigrationsConfiguration<BooksLibrary.Data.BooksLibraryDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
            //ContextKey = "BooksLibrary.Data.BooksLibraryDbContext";
        }

        protected override void Seed(BooksLibraryDbContext context)
        {
            if (!context.Roles.Any(r => r.Name == "Admin"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Admin" };

                manager.Create(role);
            }

            if (!context.Users.Any(u => u.UserName == "admin@admin.com"))
            {
                var store = new UserStore<User>(context);
                var manager = new UserManager<User>(store);
                var user = new User { UserName = "admin@admin.com" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Admin");
            }

            SeedCategories(context);
            SeedAuthors(context);
            SeedBooks(context);
        }

        private void SeedCategories(BooksLibraryDbContext context)
        {
            if (context.Categories.FirstOrDefault() == null)
            {
                var categoryNames = new string[] { "Adventure", "Sci-Fi", "Thriller", "Mystery" };

                foreach (var categoryName in categoryNames)
                {
                    var category = new Category { Name = categoryName };
                    context.Categories.Add(category);
                }

                context.SaveChanges();
            }
        }

        private void SeedAuthors(BooksLibraryDbContext context)
        {
            if (context.Authors.FirstOrDefault() == null)
            {
                for (int i = 0; i < 20; i++)
                {
                    var author = new Author { Name = "Author " + (i + 1), Info = $"Author description {i}" };
                    context.Authors.Add(author);
                }

                context.SaveChanges();
            }
        }

        private void SeedBooks(BooksLibraryDbContext context)
        {
            if (context.Books.FirstOrDefault() == null)
            {
                var random = new Random();

                var authorIds = context.Authors
                        .Select(x => x.Id)
                        .ToArray();


                var categoryIds = context.Categories
                        .Select(c => c.Id)
                        .ToArray();

                for (int i = 0; i < 100; i++)
                {
                    var book = new Book
                    {
                        Title = $"Book Title {i}",
                        Description = $"Book desription {i}",
                        CategoryId = categoryIds[random.Next(0, categoryIds.Count())],
                        AuthorId = authorIds[random.Next(0, authorIds.Count())],
                        DateAdded = new DateTime(random.Next(1950, 2016), random.Next(1, 13), random.Next(1, 29))
                    };

                    context.Books.Add(book);
                }

                context.SaveChanges();
            }
        }
    }
}
