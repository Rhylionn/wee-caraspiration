<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefaultError.aspx.cs" Inherits="DefaultError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>An error occured</h1>
    <h3>We couldn't detmine the source of this error</h3>

    <asp:Button ID="redirectButton" runat="server" Text="Go to Home" OnClick="redirectButton_Click"/>
</asp:Content>

