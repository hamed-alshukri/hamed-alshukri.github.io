<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>About Us - Oman United</title>
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
        <p>Oman United Insurance Company has seen a steady business growth since 1986 in the Insurance Market. We are reputed for our committed and dependable services with measured risk-taking. We can proudly say that we are a major player in the Oman Insurance Market.</p>

        <p>We understand the constant change in business to meet modern demands and expectations  and hence keeping in mind the individuals interests and safety, we have designed new insurance packages with wide coverage for industry & commerce, lenders and individuals alike.</p>

        <p>Our reinsurance program, led and supported by global leaders enables us to write desirable business in a flexible way with minimal referral – our experienced team is able to make a quick and best decision to serve our clients with complete protection.</p>

        <p>Our IT Department is set up with a State of Art facility & support structure to help us  serve our clients and partners better. We aren’t perfect but we are committed to constant improvement.</p>
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

