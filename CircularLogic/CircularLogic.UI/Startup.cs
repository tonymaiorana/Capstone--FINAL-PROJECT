using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CircularLogic.UI.Startup))]
namespace CircularLogic.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
