<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <link rel="stylesheet" href="style/default.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">

        <h1>Car ASPiration</h1>
        <h5>By far the best car rental service using ASP</h5>

    </div>

    <hr />
    <div style="text-align: center; margin-top: 30px;
    margin-bottom: 30px;">
        <h2>Leased cars:</h2>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="rentalId" DataSourceID="SqlDataSource1"
        GroupItemCount="3">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No rentals for now, be the first one to <asp:HyperLink ID="leaseHyperLink" runat="server"
                            NavigateUrl="~/user/leaseMyCar.aspx">lease one</asp:HyperLink>.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #FFF3E4; padding: 10px; border-radius: 10px; flex-wrap: wrap;">
                <div style="display: flex; align-items: center; gap: 50px;">
                    <div style="display: flex; flex-direction: column; width: 32%; justify-content: space-between;">
                        <div style="display: flex; gap: 5px;">
                            <b>User name:</b>

                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                        </div>
                        <br />
                        <div style="display: flex; gap: 5px;">
                            <b>Model:</b>

                            <asp:Label ID="carModelLabel" runat="server" Text='<%# Eval("carModel") %>' />
                        </div>
                        <br />
                        <div style="display: flex; gap: 5px;">
                            <b>Energy:</b>

                            <asp:Label ID="carEnergyLabel" runat="server" Text='<%# Eval("carEnergy") %>' />
                        </div>
                        <br />
                        <div style="display: flex; gap: 5px;">
                            <b>Range:</b>

                            <asp:Label ID="carRangeLabel" runat="server" Text='<%# Eval("carRange") %>' />
                        </div>
                        <br />
                        <div style="display: flex; gap: 5px;">
                            <b>Price:</b>

                            <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Eval("rentalPrice") %>' />
                        </div>
                        <br />
                        <div style="display: flex; gap: 5px;">
                            <asp:HyperLink id="hyperLinkRentalinfo" class="btn-style"
                                NavigateUrl='<%# "rentalInfo.aspx?rent=" + Eval("rentalId") %>' Text="Show more"
                                runat="server" />
                        </div>
                        <br />
                    </div>
                    <div>
                        <asp:Image style="height: 180px; border-radius: 10px;" ID="carImage" runat="server"
                            ImageUrl='<%# Eval("carImg") %>' AlternateText="Car image" />
                    </div>
                </div>
            </td>

        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="display: flex; justify-content: space-around;">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True"
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">
                UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                carModel:
                <asp:Label ID="carModelLabel" runat="server" Text='<%# Eval("carModel") %>' />
                <br />
                carEnergy:
                <asp:Label ID="carEnergyLabel" runat="server" Text='<%# Eval("carEnergy") %>' />
                <br />
                carRange:
                <asp:Label ID="carRangeLabel" runat="server" Text='<%# Eval("carRange") %>' />
                <br />
                carImg:
                <asp:Label ID="carImgLabel" runat="server" Text='<%# Eval("carImg") %>' />
                <br />
                rentalId:
                <asp:Label ID="rentalIdLabel" runat="server" Text='<%# Eval("rentalId") %>' />
                <br />
                rentalPrice:
                <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Eval("rentalPrice") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT aspnet_Users.UserName, Cars.model AS carModel, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.img AS carImg, rentals.Id AS rentalId, rentals.price AS rentalPrice FROM rentals INNER JOIN Cars ON rentals.car_id = Cars.Id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId AND Cars.owner_id = aspnet_Users.UserId WHERE (rentals.Id NOT IN (SELECT rental_id FROM Rentals_booking WHERE (rentals.Id = rental_id)))">
    </asp:SqlDataSource>
</asp:Content>
