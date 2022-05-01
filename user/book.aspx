<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="user_book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Book a car</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>Book a car</h1>
    </div>
    <div style="display: flex; justify-content: center;">
        <div class="row-form-container">
            <h2>Owerview:</h2>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <b>Model:</b>
                    
                    <asp:Label ID="carModelLabel" runat="server" Text='<%# Bind("carModel") %>' />
                    <br />
                    <b>Brand:</b>
                    
                    <asp:Label ID="carBrandLabel" runat="server" Text='<%# Bind("carBrand") %>' />
                    <br />
                    <b>Year:</b>
                    
                    <asp:Label ID="carYearLabel" runat="server" Text='<%# Bind("carYear") %>' />
                    <br />
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
                    <br />
                    <b>Price:</b>
                    
                    <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Bind("rentalPrice") %>' />
                    <br />
                    <b>Tenant:</b>
                    
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Bind("userName") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT Cars.model AS carModel, Cars.brand AS carBrand, Cars.year AS carYear, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.power AS carPower, Cars.autonomy AS carAutonomy, rentals.price AS rentalPrice, aspnet_Users.UserName AS userName FROM Cars INNER JOIN rentals ON Cars.Id = rentals.car_id INNER JOIN aspnet_Users ON Cars.owner_id = aspnet_Users.UserId AND rentals.tenant_id = aspnet_Users.UserId WHERE (rentals.Id = @rental_id)">
            <SelectParameters>
                <asp:Parameter Name="rental_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="row-form-container">
            <h2>Timeframe:</h2>
            <div>
                <div>
                    <asp:Label ID="startDateLabel" runat="server" Text="<b>Starting date:</b>"></asp:Label>
                    <asp:TextBox ID="startDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
                    <asp:CalendarExtender ID="startDateCE" Format="dd/MM/yyyy" runat="server"
                        TargetControlID="startDateTextbox"></asp:CalendarExtender>
                </div>
                <div>
                    <asp:Label ID="endDateLabel" runat="server" Text="<b>Ending date:</b>"></asp:Label>
                    <asp:TextBox ID="endDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
                    <asp:CalendarExtender ID="endDateCE" Format="dd/MM/yyyy" runat="server"
                        TargetControlID="endDateTextbox"></asp:CalendarExtender>
                </div>
            </div>

            <br />

            <asp:Label ID="totalPriceLabel" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <div class="row-form-container">
            <h3>Payment</h3>
            <p>This is a fake form for the purpose of the assignment.</p>
            <div>
                <asp:Label ID="cardNumberLabel" runat="server" Text="<b>Card number:</b>"></asp:Label>
                <asp:TextBox ID="cardNumberTextbox" runat="server"></asp:TextBox>

                <asp:RegularExpressionValidator ID="cardNumberREV" runat="server" ControlToValidate="cardNumberTextbox"
                    ErrorMessage="Please enter valid card number" ValidationExpression="^\d+">
                </asp:RegularExpressionValidator>

                <br />

                <asp:Label ID="cardNameLabel" runat="server" Text="<b>Card Name:</b>"></asp:Label>
                <asp:TextBox ID="cardNameTextbox" runat="server" autocomplete="off"></asp:TextBox>

                <br />

                <asp:Label ID="cardDateLabel" runat="server" Text="<b>Expiry date:</b>"></asp:Label>
                <asp:TextBox ID="cardDateTextbox" runat="server" autocomplete="off"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="cardDateTextbox"
                    Format="MM/yy"></asp:CalendarExtender>
                <br />

                <asp:Label ID="cardCvvLabel" runat="server" Text="<b>Security code:</b>"></asp:Label>
                <asp:TextBox ID="cardCvvTextbox" runat="server" autocomplete="off"></asp:TextBox>

                <asp:RegularExpressionValidator ID="cardCvvREV" runat="server" ControlToValidate="cardCvvTextbox"
                    ErrorMessage="Please enter valid security code" ValidationExpression="^\d+">
                </asp:RegularExpressionValidator>
                <br />
            </div>
            <asp:Button class="btn-style" ID="acceptBtn" runat="server" Text="Accept!" OnClick="acceptBtn_Click" style="height: 29px" />
        </div>
    </div>
    <div class="success-msg">
        <asp:Label ID="bookMessageLabel" runat="server" Text=""></asp:Label>
        <asp:Label ID="testLabel" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>