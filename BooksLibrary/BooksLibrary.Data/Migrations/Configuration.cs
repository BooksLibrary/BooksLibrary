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
        }
    }
}
