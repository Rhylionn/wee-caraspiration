using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rentalInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rent"] != null)
        {
            SqlDataSource1.SelectParameters["rental_id"].DefaultValue = Request.QueryString["rent"];
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
}