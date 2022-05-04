using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;

public partial class admin_viewCars : System.Web.UI.Page
{

    string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            fillListView(getDataTable());
        }
    }



    private DataTable getDataTable()
    {
        SqlConnection con = new SqlConnection(dbString);
        string selectQuery = "SELECT Id, owner_id, model, brand, year, energy, range, power, autonomy, img FROM Cars";
        SqlCommand cmd = new SqlCommand(selectQuery, con);;

        string emailTBValue = emailTB.Text;

        con.Open();

        if (!string.IsNullOrEmpty(emailTBValue))
        {
            MembershipUser user;

            try
            {
                user = Membership.GetUser(Membership.GetUserNameByEmail(emailTBValue));
            }
            catch (Exception e)
            {
                user = null;
            }

            if (user != null)
            {
                selectQuery = "SELECT Id, owner_id, model, brand, year, energy, range, power, autonomy, img FROM Cars WHERE (owner_id = @owner_id)";
                cmd = new SqlCommand(selectQuery, con);
                cmd.Parameters.AddWithValue("@owner_id", user.ProviderUserKey.ToString());
            }
        }


        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();

        return dt;
    }

    private void fillListView(DataTable dt)
    {
        carsListView.DataSource = dt;
        carsListView.DataBind();

    }
    protected void emailButton_Click(object sender, EventArgs e)
    {
        fillListView(getDataTable());
    }

    protected void carsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string carId = ((Label)carsListView.Items[e.ItemIndex].FindControl("IdLabel")).Text;

        SqlConnection con = new SqlConnection(dbString);

        // Searching for the img path a secure way
        string selectQuery = "SELECT img FROM Cars WHERE id = @Id";

        con.Open();
        SqlCommand imgCmd = new SqlCommand(selectQuery, con);
        imgCmd.Parameters.AddWithValue("@Id", carId);

        string imgDbPath = (string)imgCmd.ExecuteScalar();
        con.Close();

        string selectAssociatedRental = "SELECT Id FROM rentals WHERE car_id = @car_id";

        con.Open();
        SqlCommand rentalCmd = new SqlCommand(selectAssociatedRental, con);
        rentalCmd.Parameters.AddWithValue("@car_id", carId);

        string rentalId;
        try
        {
            rentalId = ((Guid)rentalCmd.ExecuteScalar()).ToString();
        }
        catch (Exception ex) {
            rentalId = null;
        }

       
        con.Close();

        // Check if any associated rental with the car
        if (!string.IsNullOrEmpty(rentalId)) {
            string selectAssociatedBooking = "SELECT Id FROM Rentals_booking WHERE rental_id = @rental_id";

            con.Open();
            SqlCommand selectAssociatedBookingCmd = new SqlCommand(selectAssociatedBooking, con);
            selectAssociatedBookingCmd.Parameters.AddWithValue("rental_id", rentalId);

            string bookingId;
                
            try{
                bookingId = ((Guid) selectAssociatedBookingCmd.ExecuteScalar()).ToString();
            } catch (Exception exc) {
                bookingId = null;
            }

            con.Close();

            // Check if any associated booking with the rental
            if (!string.IsNullOrEmpty(bookingId)) {
                string deleteBookingQuery = "DELETE FROM Rentals_booking WHERE Id = @Id";

                con.Open();
                SqlCommand deleteBookingCmd = new SqlCommand(deleteBookingQuery, con);
                deleteBookingCmd.Parameters.AddWithValue("@Id", bookingId);

                deleteBookingCmd.ExecuteNonQuery();
                con.Close();
            }


            string deleteRentalQuery = "DELETE FROM rentals WHERE Id = @Id";
            con.Open();
            SqlCommand deleteRentalCmd = new SqlCommand(deleteRentalQuery, con);
            deleteRentalCmd.Parameters.AddWithValue("@Id", rentalId);

            deleteRentalCmd.ExecuteNonQuery();
            con.Close();

        }

        // Check the owner id to make sure nobody can delete someone else car by bruteforcing and editing the html code.
        string deleteQuery = "DELETE FROM Cars WHERE id = @Id";

        con.Open();
        SqlCommand cmd = new SqlCommand(deleteQuery, con);
        cmd.Parameters.AddWithValue("@Id", carId);

        // Deleting the db row
        cmd.ExecuteNonQuery();
        con.Close();

        // Deleting the image

        string imgPath = Server.MapPath(imgDbPath);

        if (File.Exists(imgPath))
        {
            File.Delete(imgPath);
        }

        feedbackLabel.Text = "Car deleted";
        fillListView(getDataTable());
    }

    protected void carsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        carsListView.EditIndex = e.NewEditIndex;
        carsListView.DataSource = getDataTable();
        carsListView.DataBind();
    }

    protected void carsListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        ListViewDataItem currentCar = carsListView.Items[e.ItemIndex];

        string id = ((Label)currentCar.FindControl("CarIdLabel")).Text;
        string model = ((TextBox)currentCar.FindControl("modelTextBox")).Text;
        string brand = ((TextBox)currentCar.FindControl("brandTextBox")).Text;
        string year = ((TextBox)currentCar.FindControl("yearTextBox")).Text;
        string energy = ((TextBox)currentCar.FindControl("energyTextBox")).Text;
        string range = ((TextBox)currentCar.FindControl("rangeTextBox")).Text;
        string power = ((TextBox)currentCar.FindControl("powerTextBox")).Text;
        string autonomy = ((TextBox)currentCar.FindControl("autonomyTextBox")).Text;

        SqlConnection con = new SqlConnection(dbString);


        string updateQuery = "UPDATE Cars SET model = @model, brand = @brand, year = @year, energy = @energy, range = @range, power = @power, autonomy = @autonomy WHERE Id = @Id";

        con.Open();
        SqlCommand cmd = new SqlCommand(updateQuery, con);
        cmd.Parameters.AddWithValue("@model", model);
        cmd.Parameters.AddWithValue("@brand", brand);
        cmd.Parameters.AddWithValue("@year", Int32.Parse(year));
        cmd.Parameters.AddWithValue("@energy", energy);
        cmd.Parameters.AddWithValue("@range", range);
        cmd.Parameters.AddWithValue("@power", Int32.Parse(power));
        cmd.Parameters.AddWithValue("@autonomy", Int32.Parse(autonomy));
        cmd.Parameters.AddWithValue("@Id", id);
        cmd.ExecuteNonQuery();

        con.Close();

        carsListView.EditIndex = -1;
        fillListView(getDataTable());


        feedbackLabel.Text = "Car updated successfully!";
    }

    protected void carsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        carsListView.EditIndex = -1;
        fillListView(getDataTable());
    }
}