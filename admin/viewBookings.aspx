<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewBookings.aspx.cs" Inherits="admin_viewBookings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>View bookings</h1>
    </div>
    <asp:ListView ID="bookingsListView" runat="server" DataKeyNames="Id" OnItemDeleting="bookingsListView_ItemDeleting"
        OnItemEditing="bookingsListView_ItemEditing" OnItemUpdating="bookingsListView_ItemUpdating"
        OnItemCanceling="bookingsListView_ItemCanceling">
        <EditItemTemplate>
            <tr>
                <td class="td-style">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="modelLabelEdit" runat="server" Text='<%# Bind("model") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:Label ID="ownerLabelEdit" runat="server" Text='<%# Bind("owner") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:Label ID="tenantLabelEdit" runat="server" Text='<%# Bind("tenant") %>'></asp:Label>
                </td>
                <td class="td-style">
                    <asp:TextBox class="input-style" ID="startDateTextBox" runat="server" Text='<%# Bind("startDate") %>' />
                    <asp:CalendarExtender 
                        ID="startDateCE"
                        Format="dd/MM/yyyy" 
                        runat="server"
                        TargetControlID="startDateTextBox"></asp:CalendarExtender>
                </td>
                <td class="td-style">
                    <asp:TextBox class="input-style" ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
                    <asp:CalendarExtender 
                        ID="endDateCE" 
                        Format="dd/MM/yyyy" 
                        runat="server"
                        TargetControlID="endDateTextBox">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:Button class="btn-style" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                </td>
                <td>
                    <asp:Button class="btn-style" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td class="td-style">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="ownerLabel" runat="server" Text='<%# Eval("owner") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="tenantLabel" runat="server" Text='<%# Eval("tenant") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="startDateLabel" runat="server" Text='<%# Eval("startDate") %>' />
                </td>
                <td class="td-style">
                    <asp:Label ID="endDateLabel" runat="server" Text='<%# Eval("endDate") %>' />
                </td>
                <td>
                    <asp:Button class="btn-style" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Button class="btn-style" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style=" display: flex; justify-content: center;">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="background-color: #FFF3E4;">
                                <th runat="server">Id</th>
                                <th runat="server">model</th>
                                <th runat="server">owner</th>
                                <th runat="server">tenant</th>
                                <th runat="server">startDate</th>
                                <th runat="server">endDate</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                </td>
                <td>
                    <asp:Label ID="ownerLabel" runat="server" Text='<%# Eval("owner") %>' />
                </td>
                <td>
                    <asp:Label ID="tenantLabel" runat="server" Text='<%# Eval("tenant") %>' />
                </td>
                <td>
                    <asp:Label ID="startDateLabel" runat="server" Text='<%# Eval("startDate") %>' />
                </td>
                <td>
                    <asp:Label ID="endDateLabel" runat="server" Text='<%# Eval("endDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:Label class="success-msg" ID="feedbackMessage" runat="server" Text=""></asp:Label>
</asp:Content>