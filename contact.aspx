<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - Contact</title>
    <link rel="stylesheet" href="contact.aspx" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>Contact</h1>
        <h5>Any questions for us?</h5>
    </div>
    <div style="display: flex; justify-content: center;">
        <div class="row-form-container">
            <h2>Mail Us :</h2>
            <p>caraspi.contact@protonmail.com</p>

            <h2>Phone Us :</h2>
            <p>+45 27-31-79-36</p>

            <h2>Postal Address :</h2>
            <p><b>Street:</b> Krogvænget 99</p>
            <p><b>City:</b> København V</p>
            <p><b>State/province/area:</b> Region Sjælland</p>
        </div>
    </div>
</asp:Content>
