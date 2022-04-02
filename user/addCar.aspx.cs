using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
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

        if (string.IsNullOrEmpty(modelStr) || string.IsNullOrEmpty(brandStr) || string.IsNullOrEmpty(yearStr) || string.IsNullOrEmpty(energyStr) || string.IsNullOrEmpty(rangeStr) || string.IsNullOrEmpty(powerStr) || string.IsNullOrEmpty(autonomyStr))
        {
            resultMessage.Text = "You need to complete all the fields!";
        }
        else {

            if (fileUploadImage.HasFile)
            {
                string fileExtension = Path.GetExtension(fileUploadImage.FileName);

                if (fileExtension.Equals(".jpg") || fileExtension.Equals(".JPG") || fileExtension.Equals(".jpeg") || fileExtension.Equals(".gif"))
                {

                    string imageStr = "~/images/cars/" + this.b64url() + fileExtension;

                    string dbString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(dbString);

                    string selectStmt = "SELECT COUNT(*) FROM Cars WHERE owner_id = @Id AND (LOWER(model) = @model AND LOWER(brand) = @brand AND year = @year)";
                    con.Open();

                    SqlCommand selectCarCmd = new SqlCommand(selectStmt, con);

                    selectCarCmd.Parameters.AddWithValue("@Id", Membership.GetUser(false).ProviderUserKey.ToString());
                    selectCarCmd.Parameters.AddWithValue("@model", modelStr.ToLower());
                    selectCarCmd.Parameters.AddWithValue("@brand", brandStr.ToLower());
                    selectCarCmd.Parameters.AddWithValue("@year", int.Parse(yearStr));

                    Int32 affectedRows = (Int32) selectCarCmd.ExecuteScalar();

                    con.Close();

                    if (affectedRows > 0)
                    {
                        resultMessage.Text = "This car has already been added!";
                    }
                    else
                    {
                        fileUploadImage.SaveAs(Server.MapPath(imageStr));

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

                        resultMessage.Text = "Success, your can has been successfully added!";
                    }

                }
                else
                {
                    resultMessage.Text = "File extension not allowed!";
                }
            }
            else
            {
                resultMessage.Text = "Please upload an image.";
            } 
        
        }
    }

    private string b64url()
    {
        return Convert.ToBase64String(Guid.NewGuid().ToByteArray()) .Replace("+", "-").Replace("/", "-").Replace("=", "");
    }
}