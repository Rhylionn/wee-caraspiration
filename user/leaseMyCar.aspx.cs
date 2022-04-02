using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;

public partial class user_leaseMyCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["owner_id"].DefaultValue = Membership.GetUser(true).ProviderUserKey.ToString();
    }
    protected void leaseBtn_Click(object sender, EventArgs e)
    {

        // Check if a car have been selected
        string carIdStr = carsDropdownList.SelectedValue;
        string priceStr = textBoxPrice.Text;

        string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(dbString);

        string insertStmt = "INSERT INTO rentals (tenant_id, car_id, price) VALUES(@tenant_id, @car_id, @price)";

        con.Open();

        SqlCommand sqlCommand = new SqlCommand(insertStmt, con);

        sqlCommand.Parameters.AddWithValue("@tenant_id", Membership.GetUser(true).ProviderUserKey.ToString());
        sqlCommand.Parameters.AddWithValue("@car_id", carIdStr);
        sqlCommand.Parameters.AddWithValue("@price", float.Parse(priceStr));

        sqlCommand.ExecuteNonQuery();

        con.Close();

        leaseMessage.Text = "Success, you now leased your car";
        
    }
}