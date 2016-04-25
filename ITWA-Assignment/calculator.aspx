<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="calculator.aspx.cs" Inherits="calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Insurance Calculator - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Insurance Calculator</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="boxed-container">
        <h3 class="no-margin-top text-center">
            We are refining our insurance calculator. <br />
            Subscribe to our newsletter to inform you when the calculator is online.
        </h3>
        <div class="row">
            <div class="col two-fifths">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Your Name"></asp:TextBox>
            </div>
            <div class="col two-fifths">
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Your Email"></asp:TextBox>
            </div>
            <div class="col one-fifth last">
                <asp:Button ID="Button1" CssClass="plain-button full-width" runat="server" Text="Subscribe" />
            </div>
        </div>
    </section>
</asp:Content>

