using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;

public partial class rentalInfo : System.Web.UI.Page
{

    private string rental_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rent"] != null)
        {
           this.rental_id = Request.QueryString["rent"];
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

        SqlDataSource1.SelectParameters["rental_id"].DefaultValue = this.rental_id;
    }

    protected void bookBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("/user/book.aspx?rentalId=" + this.rental_id);
    }
}