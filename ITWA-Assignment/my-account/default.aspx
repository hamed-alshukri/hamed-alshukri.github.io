<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="my_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>My Account - Oman United</title>
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
    <section class="my-account">
        <section id="content" class="boxed-container">
            <div class="row">
                <div class="row">
                <h3 class="alignleft no-margin">My Insurance Policies</h3>
                <a href="insurance-add.aspx" class="alignright plain-button small">Apply for New Insurance</a>
                </div>
                <asp:PlaceHolder ID="InsurancesPlaceHolder" runat="server" />
            </div>
            <div class="row">
                <div class="row">
                    <h3 class="alignleft no-margin">My Support Tickets</h3>
                    <a href="../support-ticket.aspx" class="alignright plain-button small">Submit New Ticket</a>
                </div>
                <asp:PlaceHolder ID="TicketsPlaceHolder" runat="server" />
            </div>
        </section>
        <aside id="sidebar">
            <div id="account-widget" class="boxed-container">
                <h3 class="widget-title">My Insurances</h3>
                <ul class="side-menu">
                    <li><a href="insurances.aspx">All Policies</a></li>
                    <li><a href="insurances.aspx?status=active">Active Policies</a></li>
                    <li><a href="insurances.aspx?status=expired">Expired Policies</a></li>
                    <li><a href="insurances.aspx?status=pending">Pending Policies</a></li>
                    <li><a href="insurances.aspx?status=rejected">Rejected Policies</a></li>
                    <li><a href="insurance-add.aspx">New Policy</a></li>
                </ul>

                <h3 class="widget-title">My Support Tickets</h3>
                <ul class="side-menu">
                    <li><a href="tickets.aspx">All Tickets</a></li>
                    <li><a href="tickets.aspx?status=pending">Pending Tickets</a></li>
                    <li><a href="tickets.aspx?status=solved">Solved Tickets</a></li>
                    <li><a href="../support-ticket.aspx">New Ticket</a></li>
                </ul>

                <h3 class="widget-title">Settings</h3>
                <ul class="side-menu">
                    <li><a href="settings-personal.aspx?user_id=<% Response.Write(userid()); %>">Personal Information</a></li>
                    <li><a href="settings-email.aspx?user_id=<% Response.Write(userid()); %>">Email Address</a></li>
                    <li><a href="settings-password.aspx?user_id=<% Response.Write(userid()); %>">Password</a></li>
                </ul>
            </div>
        </aside>
    </section>
</asp:Content>
