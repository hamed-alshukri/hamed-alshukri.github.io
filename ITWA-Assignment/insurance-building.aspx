<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="insurance-building.aspx.cs" Inherits="insurance_building" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Building Insurance - Oman United</title>
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
    <section class="insurance">
        <section id="content" class="boxed-container">
            <p>Cover is available for either Fire & Name Perils, or “All Risks” and may be selected for Buildings and/or Contents. We also cover personal possessions and your legal liability as owner or tenant. Talk to one of our consultants about your requirements or download a Proposal Form here and send it to us for a quote</p>
        </section>
        <aside id="sidebar">
            <div id="insurance-widget" class="boxed-container list-widget">
                <h3 class="widget-title">Insurance Policies</h3>
                <ul>
                    <li><a href="insurance-building.aspx"><i class="fa fa-chevron-right"></i> Building Insurance</a></li>
                    <li><a href="insurance-health.aspx">Health Insurance</a></li>
                    <li><a href="insurance-travel.aspx">Travel Insurance</a></li>
                    <li><a href="insurance-vehicle.aspx">Vehicle Insurance</a></li>
                </ul>
            </div>
        </aside>
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
