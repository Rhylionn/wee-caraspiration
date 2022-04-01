using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;

public partial class user_myBookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["user_id"].DefaultValue = Membership.GetUser(true).ProviderUserKey.ToString();
    }

    protected void myBookingsListView_SelectedIndexChanged(object sender, EventArgs e)
    {
        string rentalBookingId = myBookingsListView.SelectedDataKey.Value.ToString();

        string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(dbString);

        string deleteStmt = "DELETE FROM Rentals_booking WHERE Id = @Id";

        con.Open();
        SqlCommand cmd = new SqlCommand(deleteStmt, con);

        cmd.Parameters.AddWithValue("@Id", rentalBookingId);

        cmd.ExecuteNonQuery();

        con.Close();

        message.Text = "Success!";
    }
}