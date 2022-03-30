<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <link rel="stylesheet" href="css/default.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>This is the home page</h1>

    <hr />

    <h2>Leased cars:</h2>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="rentalId" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No rentals for now :(</td>
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
            <td runat="server" style="">
                User name:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                Model:
                <asp:Label ID="carModelLabel" runat="server" Text='<%# Eval("carModel") %>' />
                <br />
                Energy:
                <asp:Label ID="carEnergyLabel" runat="server" Text='<%# Eval("carEnergy") %>' />
                <br />
                Range:
                <asp:Label ID="carRangeLabel" runat="server" Text='<%# Eval("carRange") %>' />
                <br />
                Price:
                <asp:Label ID="rentalPriceLabel" runat="server" Text='<%# Eval("rentalPrice") %>' />
                <br />
                <asp:HyperLink id="hyperLinkRentalinfo" 
                    NavigateUrl='<%# "rentalInfo.aspx?rent=" + Eval("rentalId") %>'
                    Text="Show more"
                    runat="server"/> 
                <br />
                <asp:Image  style="height: 200px" ID="carImage" runat="server" ImageUrl='<%# Eval("carImg") %>' AlternateText="Car image"/>

            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
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
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">UserName:
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserName, Cars.model AS carModel, Cars.energy AS carEnergy, Cars.range AS carRange, Cars.img AS carImg, rentals.Id AS rentalId, rentals.price AS rentalPrice FROM rentals INNER JOIN Cars ON rentals.car_id = Cars.Id INNER JOIN aspnet_Users ON rentals.tenant_id = aspnet_Users.UserId AND Cars.owner_id = aspnet_Users.UserId"></asp:SqlDataSource>
</asp:Content>

