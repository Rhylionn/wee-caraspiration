<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefaultError.aspx.cs" Inherits="DefaultError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
    <h1>An error occured</h1>
    <h5>Oups! Something went wrong? Try again or contact us</h5>
</div>
<div class="error-box">
    <h3>We couldn't detmine the source of this error</h3>

    <asp:Button class="btn-style" ID="redirectButton" runat="server" Text="Go to Home" OnClick="redirectButton_Click"/>
</div>
</asp:Content>

