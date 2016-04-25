<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="tickets.aspx.cs" Inherits="my_account_tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>My Support Tickets- Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>My Support Tickets</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="support-tickets boxed-container">
        <asp:Label ID="statusLabel" runat="server" Text="Ticket Status" CssClass="alignleft status-label" />
        <asp:DropDownList ID="TicketStatus" runat="server" CssClass="alignleft select-menu status-menu" AutoPostBack="true" OnSelectedIndexChanged="select_Click">
            <asp:ListItem Text="All Tickets" Value="all" />
            <asp:ListItem Text="Pending Tickets" Value="pending" />
            <asp:ListItem Text="Solved Tickets" Value="solved" />
        </asp:DropDownList>
        <a href="../support-ticket.aspx" class="alignright plain-button record-add">Submit New Ticket</a>
        <asp:PlaceHolder ID="TicketsPlaceHolder" runat="server" />
    </section>
</asp:Content>
