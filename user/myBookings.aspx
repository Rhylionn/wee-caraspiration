<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myBookings.aspx.cs" Inherits="user_myBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My bookings</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>My bookings</h1>
    </div>

    <asp:ListView ID="myBookingsListView" runat="server" DataKeyNames="bookingId" DataSourceID="SqlDataSource1"
        OnSelectedIndexChanged="myBookingsListView_SelectedIndexChanged">
        <EmptyDataTemplate>
            <span>No bookings here for now, check out the latest leased cars <asp:HyperLink ID="leasedCarsHyperLink"
                    runat="server" NavigateUrl="~/Default.aspx">here</asp:HyperLink>.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
    
            <div class="triple-form-container">
                <div style="display: flex; flex-direction: column;">
                    <b>Tenant:</b>
                    
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    <br />
                    <b>Model:</b>
                    
                    <asp:Label ID="carModelLabel" runat="server" Text='<%# Eval("carModel") %>' />
                    <br />
                    <b>Starting date:</b>
                    
                    <asp:Label ID="rentalStartDateLabel" runat="server" Text='<%# Eval("rentalStartDate") %>' />
                    <br />
                    <b>Ending date:</b>
                    
                    <asp:Label ID="rentalEndDateLabel" runat="server" Text='<%# Eval("rentalEndDate") %>' />
                    <br />
                    <asp:Button class="btn-style" ID="cancelBookingBtn" runat="server" CommandName="Select"
                        Text="Cancel booking" />
                    <br/><br/>
                </div>
            </div>
        
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM Rentals_booking WHERE (Id = @Id)"
        SelectCommand="SELECT aspnet_Users.UserName AS username, Cars.model AS carModel, Rentals_booking.startDate AS rentalStartDate, Rentals_booking.endDate AS rentalEndDate, Rentals_booking.Id AS bookingId FROM Cars INNER JOIN rentals ON Cars.Id = rentals.car_id INNER JOIN Rentals_booking ON rentals.Id = Rentals_booking.rental_id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId WHERE (Rentals_booking.user_id = @user_id)">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Object" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="user_id" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="message" runat="server" Text=""></asp:Label>
</asp:Content>