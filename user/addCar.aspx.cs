using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;


public partial class user_addCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string modelStr = textBoxModel.Text;
        string brandStr = textBoxBrand.Text;
        string yearStr = textBoxYear.Text;
        string energyStr = dropdownListEnergy.Text;
        string rangeStr = dropdownListRange.Text;
        string powerStr = textBoxPower.Text;
        string autonomyStr = textBoxAutonomy.Text;

        if (fileUploadImage.HasFile)
        {
            fileUploadImage.SaveAs(Server.MapPath("~/images/cars/" + fileUploadImage.FileName));
        }

        string imageStr = "~/images/cars/" + fileUploadImage.FileName;

        string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(dbString);

        string insertQuery = "INSERT INTO Cars (owner_id, model, brand, year, energy, range, power, autonomy, img) VALUES(@owner_id, @model, @brand, @year, @energy, @range, @power, @autonomy, @img)";

        con.Open();

        SqlCommand insertCarCmd = new SqlCommand(insertQuery, con);

        insertCarCmd.Parameters.AddWithValue("@owner_id", Membership.GetUser(true).ProviderUserKey.ToString());
        insertCarCmd.Parameters.AddWithValue("@model", modelStr);
        insertCarCmd.Parameters.AddWithValue("@brand", brandStr);
        insertCarCmd.Parameters.AddWithValue("@year", int.Parse(yearStr));
        insertCarCmd.Parameters.AddWithValue("@energy", energyStr);
        insertCarCmd.Parameters.AddWithValue("@range", rangeStr);
        insertCarCmd.Parameters.AddWithValue("@power", int.Parse(powerStr));
        insertCarCmd.Parameters.AddWithValue("@autonomy", int.Parse(autonomyStr));
        insertCarCmd.Parameters.AddWithValue("@img", imageStr);

        insertCarCmd.ExecuteNonQuery();
        con.Close();

        resultMessage.Text = "Success, your car has been added!";
    }
}