<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - Welcome</title>
    <link rel="stylesheet" href="css/welcome.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div>
        <asp:Login ID="Login1" runat="server"></asp:Login>
    </div>
    <div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>

