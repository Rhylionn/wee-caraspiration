<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewCars.aspx.cs" Inherits="admin_viewCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>View cars</h1>
    </div>
    <div style="margin-top: 10px; text-align: center;">
    <asp:Label ID="emailLabel" runat="server" Text="Email: "></asp:Label>
    <asp:TextBox class="input-style" style="width: fit-content;" ID="emailTB" runat="server"></asp:TextBox>
    <asp:Button class="btn-style" ID="emailButton" runat="server" Text="Get" OnClick="emailButton_Click" />
</div>
    <asp:ListView ID="carsListView" runat="server" DataKeyNames="Id" GroupItemCount="3"
        OnItemDeleting="carsListView_ItemDeleting" OnItemEditing="carsListView_ItemEditing"
        OnItemUpdating="carsListView_ItemUpdating" OnItemCanceling="carsListView_ItemCanceling">
        <EditItemTemplate>
            <td runat="server" class="row-form-container">
                <div style="text-align: center;">
                    <b>owner_id:</b>
                
                <asp:Label ID="owner_idLabel" runat="server" Text='<%# Bind("owner_id") %>'></asp:Label>
                <br /><b>Id:</b>
                <asp:Label ID="CarIdLabel" runat="server" Text='<%# Eval("Id") %>' />
            </div>
                <br />
                <div style="text-align: center;">
                model:
                <asp:TextBox class="input-style" ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
            </div>
            <div style="gap: 20px; display: flex; align-items: flex-end; width: 100%; justify-content: space-around;">
                <div>
                <br />year:
                <asp:TextBox class="input-style" ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
                <br />brand:
                <asp:TextBox class="input-style" ID="brandTextBox" runat="server" Text='<%# Bind("brand") %>' />
                <br />energy:
                <asp:TextBox class="input-style" ID="energyTextBox" runat="server" Text='<%# Bind("energy") %>' />
            </div>
            <div>
                <br />power:
                <asp:TextBox class="input-style" ID="powerTextBox" runat="server" Text='<%# Bind("power") %>' />
                <br />autonomy:
                <asp:TextBox class="input-style" ID="autonomyTextBox" runat="server" Text='<%# Bind("autonomy") %>' />
                <br />range:
                <asp:TextBox class="input-style" ID="rangeTextBox" runat="server" Text='<%# Bind("range") %>' />
            </div>
            </div>
                <br />img:
                <asp:Label ID="imgLabel" runat="server" Text='<%# Bind("img") %>'></asp:Label>
                <br />
                <asp:Button class="btn-style" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button class="btn-style" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
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
          
            <td runat="server" class="row-form-container">
                <div style="text-align: center;">
                    <b>owner_id:</b>
                
                <asp:Label ID="owner_idLabel" runat="server" Text='<%# Eval("owner_id") %>' />
                <br /><b>Id:</b>
                
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            </div>
            <div style="text-align: center;">
                <br /><b>model:</b>
                
                <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            </div>
            <div style="display: flex; align-items: flex-end; width: 100%; justify-content: space-around;">
            <div>
                <br /><b>year:</b>
                
                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
                <br /><b>brand:</b>
                <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                <br /><b>energy:</b>
                
                <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            </div>
            <div>
                <br /><b>power:</b>
                <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
                <br /><b>autonomy:</b>
                <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
                <br /><b>range:</b>
                
                <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            </div>
        </div>
                <br />
                <asp:Image style="width: 450px; height: 200px; margin-top: 10px; border-radius: 10px; object-fit: cover; object-position: center;" ID="img" runat="server" ImageUrl='<%# Eval("img") %>' />
                <br />
                <asp:Button class="btn-style" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button class="btn-style" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table style="display: flex;justify-content: space-around; flex-wrap: wrap;" runat="server">
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
            <td runat="server" style="">owner_id:
                <asp:Label ID="owner_idLabel" runat="server" Text='<%# Eval("owner_id") %>' />
                <br />Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />model:
                <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                <br />year:
                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
                <br />brand:
                <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                <br />energy:
                <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
                <br />power:
                <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
                <br />autonomy:
                <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
                <br />range:
                <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
                <br />img:
                <asp:Label ID="imgLabel" runat="server" Text='<%# Eval("img") %>' />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:Label class="success-msg" ID="feedbackLabel" runat="server" Text=""></asp:Label>
</asp:Content>