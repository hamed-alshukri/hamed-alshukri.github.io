<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="support.aspx.cs" Inherits="support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Support - Oman United</title>
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
    <section class="boxed-container">
        <div class="col one-half text-center">
            <a href="faq.aspx" class="sub-boxed-container">
                <i class="fa fa-question circular-icon"></i>
                <h2>FAQ</h2>
                <p>Browse a list of frequently asked questions</p>
            </a>
        </div>
        <div class="col one-half last text-center">
            <a href="support-ticket.aspx" class="sub-boxed-container">
                <i class="fa fa-ticket circular-icon"></i>
                <h2>Tickets</h2>
                <p>Submit a support ticket for your unanswered question</p>
            </a>
        </div>
    </section>
    <section class="cta">
        <div class="col three-fourths cta-text">
            We have handcrafted an insurance policy calculator specially for our valuable customers. Try it now and get an estimated price for the selected insurance policy.
        </div>
        <div class="col one-fourth last">
            <a href="calculator.aspx" class="plain-button cta-button alignright">
                Try Our Calculator
            </a>
        </div>
    </section>
</asp:Content>
