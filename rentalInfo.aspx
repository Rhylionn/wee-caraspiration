<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rentalInfo.aspx.cs" Inherits="rentalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Rental information</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">

    <div class="head-container">
        <h1>More information</h1>
    </div>

    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1"
        style="margin: 30px; margin-left: 40%; margin-right: 50%; background-color: #FFF3E4; border-radius: 10px; padding: 20px; border-collapse: separate;">
        <ItemTemplate>
            <div style="display: flex; justify-content: space-between; 
        ">
                <div>
                    <b>Price:</b>
                    
                    <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Bind("rentalPrice") %>' />
                    <br />
                    <b>Model:</b>
                    
                    <asp:Label ID="carModelLabel" runat="server" Text='<%# Bind("carModel") %>' />
                    <br />
                    <b>Brand:</b>
                    
                    <asp:Label ID="carBrandLabel" runat="server" Text='<%# Bind("carBrand") %>' />
                    <br />
                    <b>Year:</b>
                    
                    <asp:Label ID="carYearLabel" runat="server" Text='<%# Bind("carYear") %>' />
                </div>
                <br />
                <div>
                    <b>Energy:</b>
                    
                    <asp:Label ID="carEnergyLabel" runat="server" Text='<%# Bind("carEnergy") %>' />
                    <br />
                    <b>Range:</b>
                    
                    <asp:Label ID="carRangeLabel" runat="server" Text='<%# Bind("carRange") %>' />
                    <br />
                    <b>Power:</b>
                    
                    <asp:Label ID="carPowerLabel" runat="server" Text='<%# Bind("carPower") %>' />
                    <br />
                    <b>Autonomy:</b>
                    
                    <asp:Label ID="carAutonomyLabel" runat="server" Text='<%# Bind("carAutonomy") %>' />
                </div>
            </div>
            <br />
            <div style="text-align: center;">
            <b>Tenant:</b> 
            <asp:Label ID="usersNameLabel" runat="server" Text='<%# Bind("usersName") %>' />
        </div>
            <br />
            <asp:Image style="height: 200px; border-radius: 10px;" ID="carImage" runat="server" ImageUrl='<%# Bind("carImage") %>'
                AlternateText="Car image" />
            <br />
            <asp:Button ID="bookBtn" runat="server" Text="Book this car!" OnClick="bookBtn_Click" style="margin-top: 10px; margin-left: 35%; margin-right: 35%; text-decoration: none; color: #BF4342; background-color: #fff; padding: 5px; border-radius: 10px; border: solid black; cursor: pointer; font-weight: bold;"/>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT rentals.price AS rentalPrice, Cars.model AS carModel, Cars.brand AS carBrand, Cars.year AS carYear, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.power AS carPower, Cars.autonomy AS carAutonomy, Cars.img AS carImage, aspnet_Users.UserName AS usersName FROM rentals INNER JOIN Cars ON rentals.car_id = Cars.Id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId AND Cars.owner_id = aspnet_Users.UserId WHERE (rentals.Id = @rental_id)">
        <SelectParameters>
            <asp:Parameter Name="rental_id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>