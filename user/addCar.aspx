<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addCar.aspx.cs" Inherits="user_addCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Add car</title>
    <link rel="stylesheet" href="style/user.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>Add a car to my account</h1>
    </div>

    <div class="form-container">
        <div style="display: flex; justify-content: center; gap: 5px;">
        <asp:Label ID="Label1" runat="server" Text="Label"><b>Owner:</b></asp:Label>
        <asp:LoginName ID="loginName" runat="server" />
        </div>
        <br />
        <div style="display: flex; flex-direction: column; justify-content: space-around;">
        
            <asp:Label ID="labelModel" runat="server" Text="Label"><b>Model:</b> </asp:Label>
            <asp:TextBox ID="textBoxModel" runat="server" autocomplete="off"></asp:TextBox>

            <br />

            <asp:Label ID="labelBrand" runat="server" Text="Label"><b>Brand:</b> </asp:Label>
            <asp:TextBox ID="textBoxBrand" runat="server" autocomplete="off"></asp:TextBox>

            <br />

            <asp:Label ID="labelYear" runat="server" Text="Label"><b>Year:</b> </asp:Label>
            <asp:TextBox ID="textBoxYear" runat="server" autocomplete="off"></asp:TextBox>

            <asp:RegularExpressionValidator ID="yearExpressionValidator" ControlToValidate="textBoxYear" runat="server"
                ErrorMessage="Valid date only" ValidationExpression="^([0-9]{4})$">
            </asp:RegularExpressionValidator>

            <br />

            <asp:Label ID="labelEnergy" runat="server" Text="Label"><b>Energy:</b> </asp:Label>
            <asp:DropDownList ID="dropdownListEnergy" runat="server">
                <asp:ListItem Text="Petrol" Value="petrol"></asp:ListItem>
                <asp:ListItem Text="Gasoline" Value="gasoline"></asp:ListItem>
                <asp:ListItem Text="Electric" Value="electric"></asp:ListItem>
                <asp:ListItem Text="Hybrid" Value="hybrid"></asp:ListItem>
            </asp:DropDownList>
        
        <br />
        
            <asp:Label ID="labelRange" runat="server" Text="Label"><b>Range:</b> </asp:Label>
            <asp:DropDownList ID="dropdownListRange" runat="server">
                <asp:ListItem Text="Utilitarian" Value="utilitarian"></asp:ListItem>
                <asp:ListItem Text="Break" Value="break"></asp:ListItem>
                <asp:ListItem Text="Premium" Value="premium"></asp:ListItem>
                <asp:ListItem Text="Luxury" Value="luxury"></asp:ListItem>
                <asp:ListItem Text="4x4" Value="4x4"></asp:ListItem>
                <asp:ListItem Text="SUV" Value="4x4"></asp:ListItem>
            </asp:DropDownList>

            <br />

            <asp:Label ID="labelPower" runat="server" Text="Label"><b>Power:</b> </asp:Label>
            <asp:TextBox ID="textBoxPower" runat="server" autocomplete="off"></asp:TextBox>

            <asp:RegularExpressionValidator ID="powerExpressionValidator" ControlToValidate="textBoxPower"
                runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+">
            </asp:RegularExpressionValidator>

            <br />

            <asp:Label ID="labelAutonomy" runat="server" Text="Label"><b>Autonomy:</b> </asp:Label>
            <asp:TextBox ID="textBoxAutonomy" runat="server" autocomplete="off"></asp:TextBox>

            <br />

            <asp:Label ID="labelImg" runat="server" Text="Label"><b>Image:</b> </asp:Label>
            <asp:FileUpload ID="fileUploadImage" runat="server" />

            <asp:RegularExpressionValidator id="imageExpressionValidator" runat="server"
                ErrorMessage="Upload Jpegs and Gifs only."
                ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF)$"
                ControlToValidate="fileUploadImage">
            </asp:RegularExpressionValidator>
        
    </div>
        <br />

        <asp:Button ID="btnAddCar" runat="server" Text="Add a car!" OnClick="Button1_Click" class="btn-style"/>

        <asp:Label ID="resultMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>