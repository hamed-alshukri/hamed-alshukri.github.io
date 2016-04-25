<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="insurance-policies.aspx.cs" Inherits="insurance_policies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Insurance Policies - Oman United</title>
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
        <h3 class="no-margin-top">Click below on the insurance types for more details.</h3>
        <div class="row">
            <div class="col one-half text-center">
                <a href="insurance-building.aspx" class="sub-boxed-container">
                    <i class="fa fa-building circular-icon"></i>
                    <h2>Building Insurance</h2>
                </a>
            </div>
            <div class="col one-half last text-center">
                <a href="insurance-health.aspx" class="sub-boxed-container">
                    <i class="fa fa-heartbeat circular-icon"></i>
                    <h2>Health Insurance</h2>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col one-half text-center">
                <a href="insurance-travel.aspx" class="sub-boxed-container">
                    <i class="fa fa-briefcase circular-icon"></i>
                    <h2>Travel Insurance</h2>
                </a>
            </div>
            <div class="col one-half last text-center">
                <a href="insurance-vehicle.aspx" class="sub-boxed-container">
                    <i class="fa fa-car circular-icon"></i>
                    <h2>Vehicle Insurance</h2>
                </a>
            </div>
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
