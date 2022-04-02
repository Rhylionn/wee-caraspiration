<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myCars.aspx.cs" Inherits="user_myCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: My Cars</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>My cars</h1>
    <asp:ListView ID="carsListView" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <div style="">
            Owner_id:
            <asp:Label ID="owner_idLabel" runat="server" Text='<%# Eval("owner_id") %>' />
            <br />
            Model:
            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            <br />
            Brand:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            Year:
            <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
            <br />
            Energy:
            <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            <br />
            Range:
            <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            <br />
            Power:
            <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
            <br />
            Autonomy:
            <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
            <br />
            Image:
            <asp:Image style="height: 200px" ID="carImage" runat="server" ImageUrl='<%# Eval("img") %>' AlternateText="Car image" />
            <br />
            <br />
            </div>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">owner_id:
            <asp:TextBox ID="owner_idTextBox" runat="server" Text='<%# Bind("owner_id") %>' />
            <br />
            model:
            <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
            <br />
            brand:
            <asp:TextBox ID="brandTextBox" runat="server" Text='<%# Bind("brand") %>' />
            <br />
            year:
            <asp:TextBox ID="yearTextBox" runat="server" Text='<%# Bind("year") %>' />
            <br />
            energy:
            <asp:TextBox ID="energyTextBox" runat="server" Text='<%# Bind("energy") %>' />
            <br />
            range:
            <asp:TextBox ID="rangeTextBox" runat="server" Text='<%# Bind("range") %>' />
            <br />
            power:
            <asp:TextBox ID="powerTextBox" runat="server" Text='<%# Bind("power") %>' />
            <br />
            autonomy:
            <asp:TextBox ID="autonomyTextBox" runat="server" Text='<%# Bind("autonomy") %>' />
            <br />
            img:
            <asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No cars added for the moment, you can still add one <asp:HyperLink ID="addCarHyperLink" runat="server">here</asp:HyperLink>.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div style="">
            Owner_id:
            <asp:Label ID="owner_idLabel" runat="server" Text='<%# Eval("owner_id") %>' />
            <br />
            Model:
            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            <br />
            Brand:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            Year:
            <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
            <br />
            Energy:
            <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            <br />
            Range:
            <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            <br />
            Power:
            <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
            <br />
            Autonomy:
            <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
            <br />
            Image:
            <asp:Image style="height: 200px" ID="carImage" runat="server" ImageUrl='<%# Eval("img") %>' AlternateText="Car image" />
            <br />
            <br />
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <div style="">
            Owner_id:
            <asp:Label ID="owner_idLabel" runat="server" Text='<%# Eval("owner_id") %>' />
            <br />
            Model:
            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
            <br />
            Brand:
            <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
            <br />
            Year:
            <asp:Label ID="yearLabel" runat="server" Text='<%# Eval("year") %>' />
            <br />
            Energy:
            <asp:Label ID="energyLabel" runat="server" Text='<%# Eval("energy") %>' />
            <br />
            Range:
            <asp:Label ID="rangeLabel" runat="server" Text='<%# Eval("range") %>' />
            <br />
            Power:
            <asp:Label ID="powerLabel" runat="server" Text='<%# Eval("power") %>' />
            <br />
            Autonomy:
            <asp:Label ID="autonomyLabel" runat="server" Text='<%# Eval("autonomy") %>' />
            <br />
            Image:
            <asp:Image style="height: 200px" ID="carImage" runat="server" ImageUrl='<%# Eval("img") %>' AlternateText="Car image" />
            <br />
            <br />
            </div>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [owner_id], [model], [brand], [year], [energy], [range], [power], [autonomy], [img] FROM [Cars] WHERE ([owner_id] = @owner_id)">
        <SelectParameters>
            <asp:Parameter Name="owner_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

