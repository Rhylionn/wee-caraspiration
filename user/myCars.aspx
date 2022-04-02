<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myCars.aspx.cs" Inherits="user_myCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My Cars</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>My cars</h1>
    <asp:ListView ID="carsListView" runat="server" DataSourceID="SqlDataSource1" OnS>
        <AlternatingItemTemplate>
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
            img:
            <asp:Label ID="imgLabel" runat="server" Text='<%# Eval("img") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            </span style="">
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
            img:
            <asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">model:
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
            img:
            <asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
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
            img:
            <asp:Label ID="imgLabel" runat="server" Text='<%# Eval("img") %>' />
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
            img:
            <asp:Label ID="imgLabel" runat="server" Text='<%# Eval("img") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [model], [brand], [year], [energy], [range], [power], [autonomy], [img] FROM [Cars] WHERE ([owner_id] = @owner_id)" DeleteCommand="DELETE FROM Cars WHERE (Id = @carId)" UpdateCommand="UPDATE Cars SET model = @model, brand = @brand, year = @year, energy = @energy, range = @range, power = @power, autonomy = @autonomy WHERE (Id = @Id)">
        <DeleteParameters>
            <asp:Parameter Name="carId" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="owner_id" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="model" />
            <asp:Parameter Name="brand" />
            <asp:Parameter Name="year" />
            <asp:Parameter Name="energy" />
            <asp:Parameter Name="range" />
            <asp:Parameter Name="power" />
            <asp:Parameter Name="autonomy" />
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

