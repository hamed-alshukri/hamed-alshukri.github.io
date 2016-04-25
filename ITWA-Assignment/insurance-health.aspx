<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="insurance-health.aspx.cs" Inherits="insurance_health" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Health Insurance - Oman United</title>
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
            <p>Personal Accident insurance pays a fixed capital benefit for loss of limb, eye, loss of life, or for Permanent Total Disablement following an insured accident.</p>

            <p>Cover may also be extended to provide a weekly benefit for Temporary Disablement for an extra premium. Policy coverage may be for just 'Occupational Accidents Only' or for full '24 Hour' cover whether at work or at home.</p>
        </section>
        <aside id="sidebar">
            <div id="insurance-widget" class="boxed-container list-widget">
                <h3 class="widget-title">Insurance Policies</h3>
                <ul>
                    <li><a href="insurance-building.aspx">Building Insurance</a></li>
                    <li><a href="insurance-health.aspx"><i class="fa fa-chevron-right"></i> Health Insurance</a></li>
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
