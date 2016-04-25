<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="settings-password.aspx.cs" Inherits="my_account_settings_password" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Change Password - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Change Password</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="boxed-container my-account">
        <asp:Label ID="lbl_msg" runat="server" Text="" />
       <div class="row">
            <asp:label runat="server" CssClass="form-label" Text="New Password" />
            <asp:TextBox ID="Password" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="req_pass" ControlToValidate="Password" runat="server" ErrorMessage="Please enter a password for your account" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_reqpass" runat="server" TargetControlID="req_pass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:RegularExpressionValidator ID="reg_pass" ControlToValidate="Password" runat="server" ErrorMessage="Password must contain at least 8 characters, at least 1 letter and 1 number" ValidationExpression="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_regpass" runat="server" TargetControlID="reg_pass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
        </div>
        
        <div class="row">
            <asp:label runat="server" CssClass="form-label" Text="Confirm New Password" />
            <asp:TextBox ID="cPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="req_cpass" ControlToValidate="cPassword" runat="server" ErrorMessage="Please confirm your password" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_reqcpass" runat="server" TargetControlID="req_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:RegularExpressionValidator ID="reg_cpass" ControlToValidate="cPassword" runat="server" ErrorMessage="Password must contain at least 8 characters, at least 1 letter and 1 number" ValidationExpression="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_regcpass" runat="server" TargetControlID="reg_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:CompareValidator ID="comp_cpass" runat="server" ErrorMessage="Password miss match" ControlToValidate="cPassword" ControlToCompare="Password" Type="String" Operator="Equal" Display="None" />
            <asp:ValidatorCalloutExtender ID="cout_compcpass" runat="server" TargetControlID="comp_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
        </div>

        <div class="row">
            <asp:Button ID="save" CssClass="plain-button" runat="server" Text="save" OnClick="btn_update_Click" />
            <asp:Button ID="cancel" CssClass="plain-button cancel-button" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CausesValidation="false" />
        </div>
    </section>
</asp:Content>
