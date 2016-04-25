<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="mission.aspx.cs" Inherits="mission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Vision, Mission and Values - Oman United</title>
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
        <h2>Vision Statement</h2>
        <p>Our vision is to set the standard of excellence among insurance providers by being innovative, being financially strong, and exceeding customer expectations. We will attract and retain the very best employees and agents to help us achieve this goal.</p>

        <h2>Mission Statement</h2>
        <p>Oman United Insurance provides financial protection and peace of mind for our policyholders by offering quality insurance products through independent agents. In all we do, we are dedicated to going Beyond the expected.®</p>

        <h2>Our Values</h2>
        <p>In today’s uncertain world, Oman United Insurance still stands strong by adhering to our foundation of values: we are people-focused and motivated by a genuine caring for our employees, policyholders, agents, and community. Our philosophy is conservative. Our solutions, high-tech. But above all, our values are best expressed not through words, but actions. We respond. Follow through. Until we get results that go beyond … Beyond the expected.®</p>
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

