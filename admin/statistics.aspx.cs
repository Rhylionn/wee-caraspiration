using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class admin_statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);

        conn.Open();

        int result = 0;
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Cars]");
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;
            result = (int)cmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            errorMessage.Text = "No cars in the database";
        }


        int result2 = 0;
        try
        {
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM [rentals]");
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.Connection = conn;
            result2 = (int)cmd2.ExecuteScalar();
        }
        catch (Exception err) {
            errorMessage.Text = "No cars in the database";
        }


        double result3 = 0;
        try
        {
            SqlCommand cmd3 = new SqlCommand("SELECT AVG(price) FROM [rentals]");
            cmd3.CommandType = System.Data.CommandType.Text;
            cmd3.Connection = conn;
            result3 = (double)cmd3.ExecuteScalar();
            result3 = Math.Round(result3);
        } catch (Exception err) {
            errorMessage.Text = "No cars in the database";
        }


        double result4 = 0;
        try
        {
            SqlCommand cmd4 = new SqlCommand("SELECT MAX(price) FROM [rentals]");
            cmd4.CommandType = System.Data.CommandType.Text;
            cmd4.Connection = conn;
            result4 = (double)cmd4.ExecuteScalar();
        }
        catch (Exception err)
        {
            errorMessage.Text = "No cars in the database";
        }


        double result5 = 0;
        try
        {
            SqlCommand cmd5 = new SqlCommand("SELECT MIN(price) FROM [rentals]");
            cmd5.CommandType = System.Data.CommandType.Text;
            cmd5.Connection = conn;
            result5 = (double)cmd5.ExecuteScalar();
        }
        catch (Exception err)
        {
            errorMessage.Text = "No cars in the database";
        }


        int result6 = Membership.GetNumberOfUsersOnline();


        int result7 = 0;
        try
        {
            SqlCommand cmd7 = new SqlCommand("SELECT COUNT(*) FROM [aspnet_UsersInRoles] WHERE RoleId = 'baf23df3-5af6-4e5d-866b-4fb400605085'");
            cmd7.CommandType = System.Data.CommandType.Text;
            cmd7.Connection = conn;
            result7 = (int)cmd7.ExecuteScalar();
        }
        catch (Exception err)
        {
            errorMessage.Text = "No cars in the database";
        }

        int result8 = 0;
        try
        {
            SqlCommand cmd8 = new SqlCommand("SELECT COUNT(DISTINCT(tenant_id)) FROM [rentals]");
            cmd8.CommandType = System.Data.CommandType.Text;
            cmd8.Connection = conn;
            result8 = (int)cmd8.ExecuteScalar();
        }
        catch (Exception err) {
            errorMessage.Text = "No cars in the database";
        }


        int result9 = 0;
        try
        {
            SqlCommand cmd9 = new SqlCommand("SELECT COUNT(*) FROM [Rentals_booking]");
            cmd9.CommandType = System.Data.CommandType.Text;
            cmd9.Connection = conn;
            result9 = (int)cmd9.ExecuteScalar();
        }
        catch (Exception err)
        {
            errorMessage.Text = "No cars in the database";
        }
        

        conn.Close();


        numberOfCars.Text = result.ToString();
        numberOfRentals.Text = result2.ToString();
        averagePrice.Text = result3.ToString();
        maxPrice.Text = result4.ToString();
        minPrice.Text = result5.ToString();
        numberOfUsers.Text = result6.ToString();
        numberOfAdmins.Text = result7.ToString();
        numberOfUsersRenting.Text = result8.ToString();
        numberOfCarsRented.Text = result9.ToString();
    }
}