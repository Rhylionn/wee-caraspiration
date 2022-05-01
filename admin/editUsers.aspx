<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editUsers.aspx.cs" Inherits="admin_editUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - About</title>
    <link rel="stylesheet" href="css/about.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
    <h1>Edit users</h1>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <span style="">UserId:
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            LastActivityDate:
            <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Eval("LastActivityDate") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">UserId:
            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            LastActivityDate:
            <asp:TextBox ID="LastActivityDateTextBox" runat="server" Text='<%# Bind("LastActivityDate") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">UserId:
            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            LastActivityDate:
            <asp:TextBox ID="LastActivityDateTextBox" runat="server" Text='<%# Bind("LastActivityDate") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="">UserId:
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            LastActivityDate:
            <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Eval("LastActivityDate") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">UserId:
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            LastActivityDate:
            <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Eval("LastActivityDate") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationId,LoweredUserName" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" ReadOnly="True" SortExpression="ApplicationId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="LoweredUserName" HeaderText="LoweredUserName" ReadOnly="True" SortExpression="LoweredUserName" />
            <asp:BoundField DataField="MobileAlias" HeaderText="MobileAlias" SortExpression="MobileAlias" />
            <asp:CheckBoxField DataField="IsAnonymous" HeaderText="IsAnonymous" SortExpression="IsAnonymous" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Users]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM aspnet_Users" InsertCommand="INSERT INTO aspnet_Users(UserName, LastActivityDate) VALUES (,,)" SelectCommand="SELECT UserId, UserName, LastActivityDate FROM aspnet_Users" UpdateCommand="UPDATE aspnet_Users SET UserName =, LastActivityDate ="></asp:SqlDataSource>

</asp:Content>
