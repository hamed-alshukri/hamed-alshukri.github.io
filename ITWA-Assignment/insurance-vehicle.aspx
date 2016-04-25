<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="insurance-vehicle.aspx.cs" Inherits="insurance_vehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Vehicle Insurance - Oman United</title>
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
            <h3 class="no-margin-top">Private Car Insurance</h3>
            <p>Unified Motor Policy (UMP) common coverage – but with uncommon rating. Unlike other insurers, we consider several rating factors in pricing our private car insurance, not just the vehicle value but also the engine size, the age of the driver and whether it is a male or female, the age of the car itself, the type of car and what its used for. We offer attractive rates for mature drivers, especially ladies, with clean driving records of no accidents and for reasonably valued cars. If you are a young driver with a powerful, expensive car, then we are probably not the insurer for you.</p>
            <h3>Commercial Vehicles</h3>
            <p>We insure commercial vehicles for clients where we have the non-motor business too (property, contractors, liability etc) or where the commercial vehicles form part of the overall fleet risk of many vehicles owned by the client (usually 30 or more). We are not keen to insure commercial vehicles only for clients in the absence of other business.</p>
        </section>
        <aside id="sidebar">
            <div id="insurance-widget" class="boxed-container list-widget">
                <h3 class="widget-title">Insurance Policies</h3>
                <ul>
                    <li><a href="insurance-building.aspx">Building Insurance</a></li>
                    <li><a href="insurance-health.aspx">Health Insurance</a></li>
                    <li><a href="insurance-travel.aspx">Travel Insurance</a></li>
                    <li><a href="insurance-vehicle.aspx"><i class="fa fa-chevron-right"></i> Vehicle Insurance</a></li>
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
