namespace BooksLibrary.Web.App_Start
{
    using System.Data.Entity;

    using BooksLibrary.Data;
    using BooksLibrary.Data.Migrations;

    public static class DatabaseConfig
    {
        public static void Initialize()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<BooksLibraryDbContext, Configuration>());
            BooksLibraryDbContext.Create().Database.Initialize(true);
        }
    }
}