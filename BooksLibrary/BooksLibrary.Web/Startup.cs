using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BooksLibrary.Web.Startup))]
namespace BooksLibrary.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
