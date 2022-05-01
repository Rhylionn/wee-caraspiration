<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myCars.aspx.cs" Inherits="user_myCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My Cars</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
    <h1>My cars</h1>
</div>
    <asp:ListView ID="carsListView" runat="server" OnItemDeleting="carsListView_ItemDeleting" OnItemEditing="carsListView_ItemEditing" OnItemUpdating="carsListView_ItemUpdating" OnItemCanceling="carsListView_ItemCanceling">
        <EditItemTemplate>
            </span style="">
            <asp:HiddenField ID="idHF" runat="server" Value='<%# Eval("id") %>' />
            model:
            <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
            <br />
            brand:
            <asp:TextBox ID="brandTextBox" runat="server" Text='<%# Bind("brand") %>' />
            <br />
            year:
            <asp:TextBox ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
            <br />
            energy:
            <asp:TextBox ID="energyTextBox" runat="server" Text='<%# Bind("energy") %>' />
            <br />
            range:
            <asp:TextBox ID="rangeTextBox" runat="server" Text='<%# Bind("range") %>' />
            <br />
            power:
            <asp:TextBox ID="powerTextBox" runat="server" Text='<%# Bind("power") %>' />
            <br />
            autonomy:
            <asp:TextBox ID="autonomyTextBox" runat="server" Text='<%# Bind("autonomy") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>'/>
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No car registered for now :(</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
            <asp:HiddenField ID="idHF" runat="server" Value='<%# Eval("id") %>' />
            model:
            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            <br />
            brand:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            year:
            <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
            <br />
            energy:
            <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            <br />
            range:
            <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            <br />
            power:
            <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
            <br />
            autonomy:
            <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>'/>
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">model:
            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            <br />
            brand:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            year:
            <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
            <br />
            energy:
            <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            <br />
            range:
            <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            <br />
            power:
            <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
            <br />
            autonomy:
            <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>'/>
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label ID="test" runat="server" Text=""></asp:Label>
    <asp:Label ID="feedbackLabel" runat="server" Text=""></asp:Label>
</asp:Content>