using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;

public partial class welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.User.Identity.IsAuthenticated) {
            Response.Redirect(FormsAuthentication.DefaultUrl);
        }
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string username = CreateUserWizard1.UserName;
        try
        {
            Roles.AddUserToRole(username, "user");
        }
        catch (Exception err) {
            Response.Redirect(FormsAuthentication.DefaultUrl);
        }
    }
}