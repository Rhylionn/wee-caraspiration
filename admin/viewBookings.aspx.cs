using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_viewBookings : System.Web.UI.Page
{

    string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillListView(getDataTable());
        }
    }

    private DataTable getDataTable()
    {
        SqlConnection con = new SqlConnection(dbString);

        string selectQuery = "SELECT Rentals_booking.Id, Cars.model, Cars.owner_id AS owner, rentals.tenant_id AS tenant, Rentals_booking.startDate, Rentals_booking.endDate FROM Rentals_booking INNER JOIN rentals ON Rentals_booking.rental_id = rentals.Id INNER JOIN Cars ON rentals.car_id = Cars.Id";

        con.Open();
        SqlCommand cmd = new SqlCommand(selectQuery, con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Close();

        return dt;
    }

    private void fillListView(DataTable dt)
    {
        bookingsListView.DataSource = dt;
        bookingsListView.DataBind();
    }

    protected void bookingsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string bookingId = ((Label)bookingsListView.Items[e.ItemIndex].FindControl("IdLabel")).Text;

        SqlConnection con = new SqlConnection(dbString);

        string deleteQuery = "DELETE FROM Rentals_booking WHERE Id = @Id";

        con.Open();
        SqlCommand cmd = new SqlCommand(deleteQuery, con);
        cmd.Parameters.AddWithValue("@Id", bookingId);

        cmd.ExecuteNonQuery();
        con.Close();

        feedbackMessage.Text = "Booking successfully deleted";
        fillListView(getDataTable());
    }

    protected void bookingsListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        bookingsListView.EditIndex = e.NewEditIndex;
        bookingsListView.DataSource = getDataTable();
        bookingsListView.DataBind();
    }

    protected void bookingsListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        ListViewDataItem currentBooking = bookingsListView.Items[e.ItemIndex];
        string bookingId = ((Label)currentBooking.FindControl("IdLabel")).Text;
        string startDateStr = ((TextBox)currentBooking.FindControl("startDateTextBox")).Text;
        string endDateStr = ((TextBox)currentBooking.FindControl("endDateTextBox")).Text;

        string[] startDateArray = startDateStr.Split('/');
        string[] endDateArray = endDateStr.Split('/');

        DateTime startDate = new DateTime(int.Parse(startDateArray[2]), int.Parse(startDateArray[1]), int.Parse(startDateArray[0]));
        DateTime endDate = new DateTime(int.Parse(endDateArray[2]), int.Parse(endDateArray[1]), int.Parse(endDateArray[0]));

        TimeSpan timeSpan = endDate.Subtract(startDate);

        if(timeSpan.TotalHours < 0){
            feedbackMessage.Text = "Time span < 0 pleae select valid dates";
        } else {
            SqlConnection con = new SqlConnection(dbString);

            string updateQuery = "UPDATE Rentals_booking SET startDate = @startDate, endDate = @endDate WHERE Id = @Id";

            con.Open();
            SqlCommand cmd = new SqlCommand(updateQuery, con);

            cmd.Parameters.AddWithValue("@startDate", startDate);
            cmd.Parameters.AddWithValue("@endDate", endDate);
            cmd.Parameters.AddWithValue("@Id", bookingId);

            cmd.ExecuteNonQuery();
            con.Close();

            bookingsListView.EditIndex = -1;
            fillListView(getDataTable());
            feedbackMessage.Text = "Booking has been edited";
        }

    }

    protected void bookingsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        bookingsListView.EditIndex = -1;
        fillListView(getDataTable());
    }
}