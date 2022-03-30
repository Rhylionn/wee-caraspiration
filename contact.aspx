<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - Contact</title>
    <link rel="stylesheet" href="contact.aspx" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <h1>Contact page</h1>

            <table>  
                <tr>  
                    <td>from</td>  
                    <td>
                        <asp:TextBox ID="from" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFrom" runat="server" ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="from"> </asp:RequiredFieldValidator>  
                       <%-- <asp:RegularExpressionValidator ID="ExpValidatorFrom" runat="server" ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"ControlToValidate="from">  </asp:RegularExpressionValidator>  --%>
                    </td>
                </tr>

                <tr>
                    <td>subject</td>
                    <td>
                        <asp:TextBox ID="subject" runat="server" Width="99%"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorsubject" runat="server" ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="subject"></asp:RequiredFieldValidator>  
                    </td>
                </tr>

                <tr>
                    <td>content</td>
                    <td>  
                        <asp:TextBox ID="content" runat="server" Width="99%" Height="150px" TextMode="MultiLine"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorbody" runat="server" ErrorMessage="Field is Required" ForeColor="Red" ControlToValidate="content"></asp:RequiredFieldValidator>  
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="send" OnClick="send_click" runat="server" Text="send"/>  
                    </td>  
                </tr>

                 
                <tr>
                    <td>  
                        <asp:Label ID="status" runat="server">  
                        </asp:Label>  
                    </td>  
                </tr>  
            </table>
</asp:Content>

