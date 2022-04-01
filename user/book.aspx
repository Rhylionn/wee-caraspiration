<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="user_book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Book a car</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>Book a car</h1>
    <h2>Owerview:</h2>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
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
            Price:
            <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Bind("rentalPrice") %>' />
            <br />
            Tenant:
            <asp:Label ID="userNameLabel" runat="server" Text='<%# Bind("userName") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Cars.model AS carModel, Cars.brand AS carBrand, Cars.year AS carYear, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.power AS carPower, Cars.autonomy AS carAutonomy, rentals.price AS rentalPrice, aspnet_Users.UserName AS userName FROM Cars INNER JOIN rentals ON Cars.Id = rentals.car_id INNER JOIN aspnet_Users ON Cars.owner_id = aspnet_Users.UserId AND rentals.tenant_id = aspnet_Users.UserId WHERE (rentals.Id = @rental_id)">
        <SelectParameters>
            <asp:Parameter Name="rental_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h2>Timeframe:</h2>
    <div>
        <div>
            <asp:Label ID="startDateLabel" runat="server" Text="Starting date:"></asp:Label>
            <asp:TextBox ID="startDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
            <asp:CalendarExtender ID="startDateCE" Format="dd/MM/yyyy" runat="server" TargetControlID="startDateTextbox"></asp:CalendarExtender>
        </div>
        <div>
            <asp:Label ID="endDateLabel" runat="server" Text="Ending date:"></asp:Label>
            <asp:TextBox ID="endDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
            <asp:CalendarExtender ID="endDateCE" Format="dd/MM/yyyy" runat="server" TargetControlID="endDateTextbox"></asp:CalendarExtender>
        </div>
    </div>
    <h3>Payment</h3>
    <p>This is a fake form for the purpose of the assignment.</p>
    <div>
        <asp:Label ID="cardNumberLabel" runat="server" Text="Card number:"></asp:Label>
        <asp:TextBox ID="cardNumberTextbox" runat="server"></asp:TextBox>

        <asp:RegularExpressionValidator 
            ID="cardNumberREV" 
            runat="server"
            ControlToValidate="cardNumberTextbox"   
            ErrorMessage="Please enter valid card number" 
            ValidationExpression="^\d+">  
        </asp:RegularExpressionValidator>  

        <br />

        <asp:Label ID="cardNameLabel" runat="server" Text="Card Name:"></asp:Label>
        <asp:TextBox ID="cardNameTextbox" runat="server" autocomplete="off"></asp:TextBox>

        <br />

        <asp:Label ID="cardDateLabel" runat="server" Text="Expiry date:"></asp:Label>
        <asp:TextBox ID="cardDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="cardDateTextbox" Format="MM/yy"></asp:CalendarExtender>
        <br />

        <asp:Label ID="cardCvvLabel" runat="server" Text="Security code:"></asp:Label>
        <asp:TextBox ID="cardCvvTextbox" runat="server" autocomplete="off"></asp:TextBox>

        <asp:RegularExpressionValidator 
            ID="cardCvvREV" 
            runat="server"
            ControlToValidate="cardCvvTextbox"   
            ErrorMessage="Please enter valid security code" 
            ValidationExpression="^\d+">  
        </asp:RegularExpressionValidator>
        <br />
    </div>
    <asp:Button ID="acceptBtn" runat="server" Text="Accept!" OnClick="acceptBtn_Click" style="height: 29px" />

    <asp:Label ID="bookMessageLabel" runat="server" Text=""></asp:Label>
    <asp:Label ID="testLabel" runat="server" Text=""></asp:Label>
</asp:Content>

