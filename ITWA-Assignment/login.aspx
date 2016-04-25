<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Client Area - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2><%= SiteMap.CurrentNode.Title %></h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section id="msg_section" class="boxed-container msg-failed" runat="server" visible="false">
        <asp:label ID="login_msg" runat="server" CssClass="error" Text="<i class='fa fa-times'></i> You must be logged in to see the page you requested."/>
    </section>
    <section id="login" class="boxed-container">
        <fieldset id="loginform" class="no-border no-padding">
            <div class="col one-half">
                <h3>Do you have an account? Please enter your credentials below.</h3>
                <div class="row">
                    <asp:TextBox ID="email" runat="server" Placeholder="Email" />
                    <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter your email address" Display="None" SetFocusOnError="true" />
                    <asp:ValidatorCalloutExtender ID="cout_email" runat="server" TargetControlID="req_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    <asp:RegularExpressionValidator ID="reg_email" ControlToValidate="email" runat="server" ErrorMessage="Inccorect email format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                    <asp:ValidatorCalloutExtender ID="cout_regemail" runat="server" TargetControlID="reg_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                </div>
                <div class="row">
                    <asp:TextBox ID="password" runat="server" Placeholder="Password" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="req_pass" ControlToValidate="password" runat="server" ErrorMessage="Please enter a password for your account" Display="None" SetFocusOnError="true" />
                    <asp:ValidatorCalloutExtender ID="cout_reqpass" runat="server" TargetControlID="req_pass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                </div>
                <div class="row">
                    <asp:CheckBox ID="rememberme" runat="server" Text="Remember Me" />
                </div>
                <div class="row">
                    <asp:Button ID="acc_login" CssClass="plain-button" runat="server" Text="Login" OnClick="btn_log_Click"/>
                </div>
            </div>
            <div class="col one-half last">
                <h3>If you do not have an account, please register a new account.</h3>
                <p class="text-center">
                    <a href="register.aspx" class="plain-button">Register A New Account</a>
                </p>
            </div>
            <div class="ver-line">
                <span id="or-line">OR</span>
            </div>
        </fieldset>
    </section>
</asp:Content>

