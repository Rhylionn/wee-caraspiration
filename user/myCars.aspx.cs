using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class user_myCars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["owner_id"].DefaultValue = Membership.GetUser(true).ProviderUserKey.ToString();
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void carsListView_DeleteItem(int id)
    {
        test.Text = "delete clicked";
    }
}