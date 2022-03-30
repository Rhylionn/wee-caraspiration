<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rentalInfo.aspx.cs" Inherits="rentalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Rental information</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>More information</h1

    <asp:Label ID="rentalLabel" runat="server" Text="Label"></asp:Label>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="rentalPrice" HeaderText="rentalPrice" SortExpression="rentalPrice" />
            <asp:BoundField DataField="carModel" HeaderText="carModel" SortExpression="carModel" />
            <asp:BoundField DataField="carBrand" HeaderText="carBrand" SortExpression="carBrand" />
            <asp:BoundField DataField="carYear" HeaderText="carYear" SortExpression="carYear" />
            <asp:BoundField DataField="carEnergy" HeaderText="carEnergy" SortExpression="carEnergy" />
            <asp:BoundField DataField="carRange" HeaderText="carRange" SortExpression="carRange" />
            <asp:BoundField DataField="carPower" HeaderText="carPower" SortExpression="carPower" />
            <asp:BoundField DataField="carAutonomy" HeaderText="carAutonomy" SortExpression="carAutonomy" />
            <asp:BoundField DataField="carImage" HeaderText="carImage" SortExpression="carImage" />
            <asp:BoundField DataField="usersName" HeaderText="usersName" SortExpression="usersName" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT rentals.price AS rentalPrice, Cars.model AS carModel, Cars.brand AS carBrand, Cars.year AS carYear, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.power AS carPower, Cars.autonomy AS carAutonomy, Cars.img AS carImage, aspnet_Users.UserName AS usersName FROM rentals INNER JOIN Cars ON rentals.car_id = Cars.Id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId AND Cars.owner_id = aspnet_Users.UserId WHERE (rentals.Id = @rental_id)">
        <SelectParameters>
            <asp:Parameter Name="rental_id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

