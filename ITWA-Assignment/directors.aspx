<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Board of Directors - Oman United</title>
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
        <table id="directors-list">
            <tr>
                <td><img src="img/Avatar-Manager-1.png" alt="1st Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-2.png" alt="2nd Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-3.png" alt="3rd Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-1.png" alt="4th Director" class="avatar" /></td>
            </tr>
            <tr>
                <td>
                    <h3>Jamal AlBusaidi</h3>
                    <h4>Chairman of the Board</h4>
                </td>
                <td>
                    <h3>Wafa AlHadidi</h3>
                    <h4>Vice Chair</h4>
                </td>
                <td>
                    <h3>Dawood AlRiyami</h3>
                    <h4>Board Member</h4>
                </td>
                <td>
                    <h3>Kamel AlZidjali</h3>
                    <h4>Board Member</h4>
                </td>
            </tr>
            <tr>
                <td><img src="img/Avatar-Manager-2.png" alt="5th Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-3.png" alt="6th Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-1.png" alt="7th Director" class="avatar" /></td>
                <td><img src="img/Avatar-Manager-2.png" alt="8th Director" class="avatar" /></td>
            </tr>
            <tr>
                <td>
                    <h3>Ghalia AlRiyami</h3>
                    <h4>Board Member</h4>
                </td>
                <td>
                    <h3>John Smith</h3>
                    <h4>Board Member</h4>
                </td>
                <td>
                    <h3>Richard Smith</h3>
                    <h4>Board Member</h4>
                </td>
                <td>
                    <h3>Jane Doe</h3>
                    <h4>Board Member</h4>
                </td>
            </tr>
        </table>
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

