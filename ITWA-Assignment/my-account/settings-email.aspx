<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="settings-email.aspx.cs" Inherits="my_account_settings_email" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Change Email - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Change Email</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="boxed-container my-account">
        <asp:Label ID="lbl_msg" runat="server" Text="" />
       <div class="row">
            <asp:label ID="cur_email_label" runat="server" CssClass="form-label" Text="Current Email" />
            <asp:TextBox ID="cur_email" runat="server" Enabled="false" CssClass="disabled" />
        </div>

       <div class="row">
            <asp:label ID="email_label" runat="server" CssClass="form-label" Text="New Email" />
            <asp:TextBox ID="Email" runat="server" />
            <asp:RequiredFieldValidator ID="req_email" ControlToValidate="Email" runat="server" ErrorMessage="Please enter your email" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_email" runat="server" TargetControlID="req_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:RegularExpressionValidator ID="reg_email" ControlToValidate="Email" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_regemail" runat="server" TargetControlID="reg_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
        </div>
        
        <div class="row">
            <asp:label ID="cmail_label" runat="server" CssClass="form-label" Text="Confirm New Email" />
            <asp:TextBox ID="cEmail" runat="server" />
            <asp:RequiredFieldValidator ID="req_cemail" ControlToValidate="cEmail" runat="server" ErrorMessage="Please confirm your email" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_cemail" runat="server" TargetControlID="req_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:RegularExpressionValidator ID="reg_cemail" ControlToValidate="cEmail" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
            <asp:ValidatorCalloutExtender ID="cout_regcemail" runat="server" TargetControlID="reg_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
            <asp:CompareValidator ID="comp_cemail" runat="server" ErrorMessage="Confirmatin is not consistant with email entered in the previous field" ControlToValidate="cEmail" ControlToCompare="Email" Type="String" Operator="Equal" Display="None" />
            <asp:ValidatorCalloutExtender ID="cout_compemail" runat="server" TargetControlID="comp_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
        </div>

        <div class="row">
            <asp:Button ID="save" CssClass="plain-button" runat="server" Text="save" OnClick="btn_update_Click" />
            <asp:Button ID="cancel" CssClass="plain-button cancel-button" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CausesValidation="false" />
        </div>
    </section>
</asp:Content>
