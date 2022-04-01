using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class user_book : System.Web.UI.Page
{
    private string rental_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rentalId"] != null)
        {
            this.rental_id = Request.QueryString["rentalId"];
        }
        else {
            Response.Redirect("~/Default.aspx");
        }

        SqlDataSource1.SelectParameters["rental_id"].DefaultValue = this.rental_id;
    }


    protected void acceptBtn_Click(object sender, EventArgs e)
    {

        string startDateStr = (string)startDateTextbox.Text;
        string endDateStr = endDateTextbox.Text;

        string cardNumberStr = cardNumberTextbox.Text;
        string cardNameStr = cardNameTextbox.Text;
        string cardDateStr = cardDateTextbox.Text;
        string cardCodeStr = cardCvvTextbox.Text;

        string bookMessage = bookMessageLabel.Text;

        if (string.IsNullOrEmpty(startDateStr) || string.IsNullOrEmpty(endDateStr) || string.IsNullOrEmpty(cardNumberStr) || string.IsNullOrEmpty(cardNameStr) || string.IsNullOrEmpty(cardDateStr) || string.IsNullOrEmpty(cardCodeStr))
        {
            bookMessageLabel.Text = "All fields need to be filled";
        }
        else {

            string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(dbString);

            string selectStmt = "SELECT Id, tenant_id FROM rentals WHERE Id = @Id";

            con.Open();

            SqlCommand selectCmd = new SqlCommand(selectStmt, con);
            selectCmd.Parameters.AddWithValue("@Id", (object)this.rental_id);

            SqlDataReader dr = selectCmd.ExecuteReader();

            string tenant_id = dr.Read() ? dr["tenant_id"].ToString() : null;

            dr.Close();
            con.Close();

            if(tenant_id.Equals(Membership.GetUser(false).ProviderUserKey.ToString()))
            {
                bookMessageLabel.Text = "You can't book your own rental!";
            } 
            else {

                string[] startDateArray = startDateStr.Split('/');
                string[] endDateArray = endDateStr.Split('/');

                DateTime startDate = new DateTime(int.Parse(startDateArray[2]), int.Parse(startDateArray[1]), int.Parse(startDateArray[0]));
                DateTime endDate = new DateTime(int.Parse(endDateArray[2]), int.Parse(endDateArray[1]), int.Parse(endDateArray[0]));

                TimeSpan timeSpan = endDate.Subtract(startDate);

                if (timeSpan.TotalHours < 0)
                {
                    bookMessageLabel.Text = "Ending date cannot be before the starting one.";
                }
                else 
                {  
                    string insertStmt = "INSERT INTO Rentals_booking (rental_id, user_id, startDate, endDate) VALUES(@rental_id, @user_id, @startDate, @endDate)";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(insertStmt, con);

                    cmd.Parameters.AddWithValue("@rental_id", this.rental_id);
                    cmd.Parameters.AddWithValue("@user_id", Membership.GetUser(true).ProviderUserKey.ToString());
                    cmd.Parameters.AddWithValue("@startDate", startDate);
                    cmd.Parameters.AddWithValue("@endDate", endDate);

                    cmd.ExecuteNonQuery();

                    con.Close();

                    bookMessageLabel.Text = "The car is now yours!";
                }
            }
        }
    }
}