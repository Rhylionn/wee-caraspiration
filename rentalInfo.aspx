<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rentalInfo.aspx.cs" Inherits="rentalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Rental information</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>More information</h1

    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            Price:
            <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Bind("rentalPrice") %>' />
            <br />
            Model:
            <asp:Label ID="carModelLabel" runat="server" Text='<%# Bind("carModel") %>' />
            <br />
            Brand:
            <asp:Label ID="carBrandLabel" runat="server" Text='<%# Bind("carBrand") %>' />
            <br />
            Year:
            <asp:Label ID="carYearLabel" runat="server" Text='<%# Bind("carYear") %>' />
            <br />
            Energy:
            <asp:Label ID="carEnergyLabel" runat="server" Text='<%# Bind("carEnergy") %>' />
            <br />
            Range:
            <asp:Label ID="carRangeLabel" runat="server" Text='<%# Bind("carRange") %>' />
            <br />
            Power:
            <asp:Label ID="carPowerLabel" runat="server" Text='<%# Bind("carPower") %>' />
            <br />
            Autonomy:
            <asp:Label ID="carAutonomyLabel" runat="server" Text='<%# Bind("carAutonomy") %>' />
            <br />
            Tenant:
            <asp:Label ID="usersNameLabel" runat="server" Text='<%# Bind("usersName") %>' />
            <br />
            <asp:Image style="height: 200px" ID="carImage" runat="server" ImageUrl='<%# Bind("carImage") %>' AlternateText="Car image" />
            <br />
            <asp:Button ID="bookBtn" runat="server" Text="Book this car!" OnClick="bookBtn_Click" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT rentals.price AS rentalPrice, Cars.model AS carModel, Cars.brand AS carBrand, Cars.year AS carYear, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.power AS carPower, Cars.autonomy AS carAutonomy, Cars.img AS carImage, aspnet_Users.UserName AS usersName FROM rentals INNER JOIN Cars ON rentals.car_id = Cars.Id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId AND Cars.owner_id = aspnet_Users.UserId WHERE (rentals.Id = @rental_id)">
        <SelectParameters>
            <asp:Parameter Name="rental_id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

