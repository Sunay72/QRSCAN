using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QRcode_Reader.Startup))]
namespace QRcode_Reader
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
