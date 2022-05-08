using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class admin_editUsers : System.Web.UI.Page
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

        string selectQuery = "SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Membership.Email, aspnet_Membership.CreateDate, aspnet_Membership.LastLoginDate FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId";

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
        userListView.DataSource = dt;
        userListView.DataBind();
    }

    protected void userListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        Guid userId = Guid.Parse(((Label)userListView.Items[e.ItemIndex].FindControl("UserIdLabel")).Text);

        string username = Membership.GetUser(userId).UserName;
        string[] roles = Roles.GetRolesForUser(username);

        foreach (string role in roles) {
            if (role.Equals("user")) {
                Roles.RemoveUserFromRole(username, "user");
            }
            else if (role.Equals("admin")) {
                Roles.RemoveUserFromRole(username, "admin");
            }
        }

        Membership.DeleteUser(username, true);

        feedbackMessage.Text = "User have been deleted";
        fillListView(getDataTable());
    }

    protected void userListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        userListView.EditIndex = e.NewEditIndex;
        userListView.DataSource = getDataTable();
        userListView.DataBind();
    }

    protected void userListView_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        ListViewDataItem currentUser = userListView.Items[e.ItemIndex];
        Guid userId = Guid.Parse(((Label)currentUser.FindControl("UserIdLabelEdit")).Text);
        string userEmail = ((TextBox)currentUser.FindControl("EmailTextBoxEdit")).Text;

        MembershipUser user = Membership.GetUser(userId);
        user.Email = userEmail;

        Membership.UpdateUser(user);

        userListView.EditIndex = -1;
        fillListView(getDataTable());
        feedbackMessage.Text = "user updated";
    }

    protected void userListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        userListView.EditIndex = -1;
        fillListView(getDataTable());
    }
    protected void userListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        ListViewItem currentUser = (ListViewItem) e.Item;

        if (e.CommandName == "Promote") {
            Guid userId = Guid.Parse(((Label)currentUser.FindControl("UserIdLabel")).Text);
            string username = Membership.GetUser(userId).UserName;

            try
            {
                Roles.RemoveUserFromRole(username, "user");
                Roles.AddUserToRole(username, "admin");
            }
            catch (Exception err) {
                feedbackMessage.Text = "Couldn't update user's role";
            }
        }
    }
}