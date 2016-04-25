<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="insurances.aspx.cs" Inherits="my_account_insurances" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>My Insurances- Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>My Insurances</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="insurance-policies boxed-container">
        <asp:Label ID="statusLabel" runat="server" Text="Insurance Policy Status" CssClass="alignleft status-label" />
        <asp:DropDownList ID="PolicyStatus" runat="server" CssClass="alignleft select-menu status-menu" AutoPostBack="true" OnSelectedIndexChanged="select_Click">
            <asp:ListItem Text="All Policies" Value="all" />
            <asp:ListItem Text="Active Policies" Value="active" />
            <asp:ListItem Text="Expired Policies" Value="expired" />
            <asp:ListItem Text="Pending Policies" Value="pending" />
            <asp:ListItem Text="Rejected Policies" Value="rejected" />
        </asp:DropDownList>
        <a href="insurance-add.aspx" class="alignright plain-button record-add" id="newInsurance" runat="server">Submit New Insurance Policy</a>
        <asp:PlaceHolder ID="InsurancesPlaceHolder" runat="server" />
    </section>
</asp:Content>
