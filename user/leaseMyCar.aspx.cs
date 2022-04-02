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

        string carIdStr = carsDropdownList.SelectedValue;
        string priceStr = textBoxPrice.Text;


        if (string.IsNullOrEmpty(priceStr) || string.IsNullOrEmpty(carIdStr))
        {

            leaseMessage.Text = "Please, fill all inputs";

        }
        else {

            string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(dbString);

            string carExistsStmt = "SELECT COUNT(*) FROM Cars WHERE Id = @car_id";


            con.Open();

            SqlCommand carExistsCmd = new SqlCommand(carExistsStmt, con);
            carExistsCmd.Parameters.AddWithValue("@car_id", carIdStr);

            Int32 nbCars = (Int32) carExistsCmd.ExecuteScalar();

            con.Close();

            if (nbCars > 0)
            {

                string carRentedStmt = "SELECT COUNT(*) FROM rentals WHERE car_id = @carId";

                con.Open();
                SqlCommand selectRentalsCmd = new SqlCommand(carRentedStmt, con);
                selectRentalsCmd.Parameters.AddWithValue("@carId", carIdStr);

                Int32 selectedRentals = (Int32)selectRentalsCmd.ExecuteScalar();

                con.Close();

                if (selectedRentals > 0)
                {
                    leaseMessage.Text = "This car have already been leased";
                }
                else {

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
            else {
                leaseMessage.Text = "This car doesn't exists";
            }

        }


        // Check if a car have been selected and exists

        

        // Check if car already leased

        
    }
}