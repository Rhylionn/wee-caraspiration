<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UnauthorizedError.aspx.cs" Inherits="UnauthorizedError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>Error 401 - Unauthorized</h1>
    <h3>You don't have the necessary rights to access this page</h3>

    <asp:Button ID="redirectButton" runat="server" Text="Go to Home" OnClick="redirectButton_Click"/>
</asp:Content>

