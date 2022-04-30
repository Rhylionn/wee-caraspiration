using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;

public partial class user_myCars : System.Web.UI.Page

{

    private String userId;
    string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {

        this.userId = Membership.GetUser(true).ProviderUserKey.ToString();

        if (!IsPostBack) {
            fillListView(getDataTable());
        }

    }

    private DataTable getDataTable() {
        SqlConnection con = new SqlConnection(dbString);

        string selectQuery = "SELECT [id], [model], [brand], [year], [energy], [range], [power], [autonomy], [img] FROM [Cars] WHERE ([owner_id] = @owner_id)";

        con.Open();
        SqlCommand cmd = new SqlCommand(selectQuery, con);
        cmd.Parameters.AddWithValue("@owner_id", userId);

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

    protected void carsListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        string carId = ((HiddenField)carsListView.Items[e.ItemIndex].FindControl("idHF")).Value;

        SqlConnection con = new SqlConnection(dbString);

        
        // Check the owner id to make sure nobody can delete someone else car by bruteforcing and editing the html code.
        string deleteQuery = "DELETE FROM Cars WHERE id = @Id AND owner_id = @owner_id";

        con.Open();
        SqlCommand cmd = new SqlCommand(deleteQuery, con);
        cmd.Parameters.AddWithValue("@Id", carId);
        cmd.Parameters.AddWithValue("@owner_id", userId);

        cmd.ExecuteNonQuery();
        con.Close();

        feedbackLabel.Text = "The car has been sucessfully deleted";
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

        string id = ((HiddenField)currentCar.FindControl("idHF")).Value;
        string model = ((TextBox)currentCar.FindControl("modelTextBox")).Text;
        string brand = ((TextBox)currentCar.FindControl("brandTextBox")).Text;
        string year = ((TextBox)currentCar.FindControl("yearTextBox")).Text;
        string energy = ((TextBox)currentCar.FindControl("energyTextBox")).Text;
        string range = ((TextBox)currentCar.FindControl("rangeTextBox")).Text;
        string power = ((TextBox)currentCar.FindControl("powerTextBox")).Text;
        string autonomy = ((TextBox)currentCar.FindControl("autonomyTextBox")).Text;

        SqlConnection con = new SqlConnection(dbString);

        string updateQuery = "UPDATE Cars SET model = @model, brand = @brand, year = @year, energy = @energy, range = @range, power = @power, autonomy = @autonomy WHERE Id = @Id AND owner_id = @owner_id";

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
        cmd.Parameters.AddWithValue("@owner_id", userId);

        cmd.ExecuteNonQuery();
        con.Close();

        carsListView.EditIndex = -1;
        fillListView(getDataTable());
        feedbackLabel.Text = "Your car has been successfully updated!";
    }
    protected void carsListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        carsListView.EditIndex = -1;
        fillListView(getDataTable());
    }
}