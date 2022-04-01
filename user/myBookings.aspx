<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myBookings.aspx.cs" Inherits="user_myBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My bookings</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>My bookings</h1>


    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bookingId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            carModel:
            <asp:Label ID="carModelLabel" runat="server" Text='<%# Eval("carModel") %>' />
            <br />
            rentalStartDate:
            <asp:Label ID="rentalStartDateLabel" runat="server" Text='<%# Eval("rentalStartDate") %>' />
            <br />
            rentalEndDate:
            <asp:Label ID="rentalEndDateLabel" runat="server" Text='<%# Eval("rentalEndDate") %>' />
            <br />
            bookingId:
            <asp:Label ID="bookingIdLabel" runat="server" Text='<%# Eval("bookingId") %>' />
            <br />
            <asp:Button ID="DeleteButton" runat="server" CommandName="Select" Text="Cancel booking" />
<br /><br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Rentals_booking WHERE (Id = @Id)" SelectCommand="SELECT aspnet_Users.UserName AS username, Cars.model AS carModel, Rentals_booking.startDate AS rentalStartDate, Rentals_booking.endDate AS rentalEndDate, Rentals_booking.Id AS bookingId FROM Cars INNER JOIN rentals ON Cars.Id = rentals.car_id INNER JOIN Rentals_booking ON rentals.Id = Rentals_booking.rental_id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId WHERE (Rentals_booking.user_id = @user_id)">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Object"/>
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="user_id" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="message" runat="server" Text=""></asp:Label>
</asp:Content>

