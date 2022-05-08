<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editUsers.aspx.cs" Inherits="admin_editUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - About</title>
    <link rel="stylesheet" href="css/about.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>Edit users</h1>
    </div>
    <asp:ListView ID="userListView" runat="server" OnItemDeleting="userListView_ItemDeleting" OnItemEditing="userListView_ItemEditing" OnItemUpdating="userListView_ItemUpdating" OnItemCanceling="userListView_ItemCanceling" OnItemCommand="userListView_ItemCommand">
        <EditItemTemplate>
            <tr style="">
                <td class="td-style">
                    <asp:Label ID="UserIdLabelEdit" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:Label ID="UserNameLabelEdit" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:TextBox class="input-style" ID="EmailTextBoxEdit" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </td>
                <td class="td-style">
                    <asp:Label ID="CreatedDateLabelEdit" runat="server" Text='<%# Bind("CreateDate") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:Label ID="LastLoginDateLabelEdit" runat="server" Text='<%# Bind("LastLoginDate") %>'></asp:Label>
                </td>
               <td class="td-style">
                    <asp:Button class="btn-style" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button class="btn-style" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td class="td-style">No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td class="td-style">
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="LastLoginDateLabel" runat="server" Text='<%# Eval("LastLoginDate") %>' />
                </td>
                <td class="td-style">
                    <asp:Button class="btn-style" ID="editButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td class="td-style">
                    <asp:Button class="btn-style" ID="deleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td class="td-style">
                    <asp:Button class="btn-style" ID="promoteButton" runat="server" CommandName="Promote" Text="Promote" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style=" display: flex; justify-content: center;">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="background-color: #FFF3E4;">
                                <th runat="server">UserId</th>
                                <th runat="server">UserName</th>
                                <th runat="server">Email</th>
                                <th runat="server">CreateDate</th>
                                <th runat="server">LastLoginDate</th>
                                <th runat="server">Edit</th>
                                <th runat="server">Delete</th>
                                <th runat="server">Promote</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td class="td-style">
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="LastLoginDateLabel" runat="server" Text='<%# Eval("LastLoginDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:Label ID="feedbackMessage" runat="server" Text=""></asp:Label>
</asp:Content>
