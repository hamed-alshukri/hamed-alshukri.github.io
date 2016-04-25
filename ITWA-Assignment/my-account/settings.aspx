<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="my_account_settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Settings - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Settings</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="msg_section" class="boxed-container msg-success" runat="server" visible="false">
        <asp:label ID="settings_msg" runat="server" Text=""/>
    </section>
    <section class="my-account">
        <div class="col one-third boxed-container icon">
            <i class="fa fa-user"></i>
            <h3 class="text-center">Personal Information</h3>
            <p>Need to update  your personal informations? Keeping your personal information up to date will help us in providing better services to you.</p>
            <a href="settings-personal.aspx" id="settings_personal" class="plain-button full-width" runat="server">Update Personal Information</a>
        </div>
        <div class="col one-third boxed-container icon">
            <i class="fa fa-envelope"></i>
            <h3 class="text-center">Email Address</h3>
            <p>If your email address is changed or you need to login using another email, then change it from here.</p>
            <a href="settings-email.aspx" id="settings_email" class="plain-button full-width" runat="server">Change Email Address</a>
        </div>
        <div class="col one-third last boxed-container icon">
            <i class="fa fa-unlock-alt"></i>
            <h3 class="text-center">Password</h3>
            <p>Setting a strong password ensures that nobody will access your account with your permission.</p>
            <a href="settings-password.aspx" id="settings_password" class="plain-button full-width" runat="server">Change Password</a>
        </div>
    </section>
</asp:Content>
