<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myCars.aspx.cs" Inherits="user_myCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My Cars</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>My cars</h1>
    </div>
    <asp:ListView ID="carsListView" class="mycars" runat="server" OnItemDeleting="carsListView_ItemDeleting"
        OnItemEditing="carsListView_ItemEditing" OnItemUpdating="carsListView_ItemUpdating"
        OnItemCanceling="carsListView_ItemCanceling">
        
        <EditItemTemplate>
            
                <div class="row-form-container">
                    <asp:HiddenField ID="idHF" runat="server" Value='<%# Eval("id") %>' />
                    <div style="text-align: center;">
                        <b>model:</b>

                        <asp:TextBox class="input-style" ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    </div>
                    <br />
                    <div
                        style="gap: 20px; display: flex; align-items: flex-end; width: 100%; justify-content: space-around;">
                        <div>
                            <b>brand:</b>

                            <asp:TextBox class="input-style" ID="brandTextBox" runat="server"
                                Text='<%# Bind("brand") %>' />
                            <br />
                            <b>year:</b>

                            <asp:TextBox class="input-style" ID="yearTextBox" runat="server"
                                Text='<%# Bind("year") %>' />
                            <br />
                            <b>energy:</b>

                            <asp:TextBox class="input-style" ID="energyTextBox" runat="server"
                                Text='<%# Bind("energy") %>' />
                        </div>
                        <div>
                            <br />
                            <b>range:</b>

                            <asp:TextBox class="input-style" ID="rangeTextBox" runat="server"
                                Text='<%# Bind("range") %>' />
                            <br />
                            <b>power:</b>

                            <asp:TextBox class="input-style" ID="powerTextBox" runat="server"
                                Text='<%# Bind("power") %>' />
                            <br />
                            <b>autonomy:</b>

                            <asp:TextBox class="input-style" ID="autonomyTextBox" runat="server"
                                Text='<%# Bind("autonomy") %>' />
                        </div>
                        <br />
                    </div>
                    <asp:Image ID="Image1" style="width: 400px; display: flex; margin: 10px 12% 0; border-radius: 10px;"
                        runat="server" ImageUrl='<%# Eval("img") %>' />
                    <br />
                    <asp:Button class="btn-style" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button class="btn-style" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                </div>
            
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No car registered for now :(</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="row-form-container">
                <asp:HiddenField ID="idHF" runat="server" Value='<%# Eval("id") %>' />
                <div style="text-align: center;">
                    <b>model:</b>

                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                </div>
                <div style="display: flex; align-items: flex-end; width: 100%; justify-content: space-around;">
                    <div>
                        <b>brand:</b>

                        <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                        <br />
                        <b>year:</b>

                        <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
                        <br />
                        <b>energy:</b>

                        <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
                    </div>
                    <div>
                        <br />
                        <b>range:</b>

                        <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
                        <br />
                        <b>power:</b>

                        <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
                        <br />
                        <b>autonomy:</b>

                        <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
                        <br />
                    </div>
                </div>
                <asp:Image ID="Image1" style="width: 280px; height: 150px; margin-top: 10px; border-radius: 10px; object-fit: cover; object-position: center;" runat="server"
                    ImageUrl='<%# Eval("img") %>' />
                <br />
                <asp:Button class="btn-style" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button class="btn-style" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
                <br />
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">model:
                <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                <br />
                brand:
                <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                <br />
                year:
                <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
                <br />
                energy:
                <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
                <br />
                range:
                <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
                <br />
                power:
                <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
                <br />
                autonomy:
                <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label class="success-msg" ID="test" runat="server" Text=""></asp:Label>
    <asp:Label class="success-msg" ID="feedbackLabel" runat="server" Text=""></asp:Label>
</asp:Content>