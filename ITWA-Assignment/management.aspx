<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="management.aspx.cs" Inherits="management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Management - Oman United</title>
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
    <section class="boxed-container management">
        <div class="row">
            <div class="alignleft">
                <img src="img/Avatar-Manager-1.png" alt="First Manager" class="avatar" />
            </div>
            <div class="mgt-details alignright">
                <h2>Said AlJahwari</h2>
                <h3>Chief Executive Officer</h3>
                <p>Pug letterpress ethnic craft beer pinterest, truffaut beard intelligentsia polaroid cred occupy artisan pickled. Sartorial selvage kogi, thundercats jean shorts echo park fap helvetica pork belly 3 wolf moon pop-up squid intelligentsia.  Lomo laboris fixie kogi, etsy disrupt aliquip pop-up pinterest odio adipisicing viral esse. </p>
                <p class="mgt-social">
                    <a href="#" class="social"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="social"><i class="fa fa-google-plus"></i></a>
                    <a href="#" class="social"><i class="fa fa-flickr"></i></a>
                    <a href="#" class="social"><i class="fa fa-youtube"></i></a>
                    <a href="#" class="social"><i class="fa fa-vimeo"></i></a>
                    <a href="#" class="social"><i class="fa fa-rss"></i></a>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="alignleft">
                <img src="img/Avatar-Manager-2.png" alt="Second Manager" class="avatar" />
            </div>
            <div class="mgt-details alignright">
                <h2>Fatima AlHabsi</h2>
                <h3>Chief Financial Officer</h3>
                <p>Pug letterpress ethnic craft beer pinterest, truffaut beard intelligentsia polaroid cred occupy artisan pickled. Sartorial selvage kogi, thundercats jean shorts echo park fap helvetica pork belly 3 wolf moon pop-up squid intelligentsia.  Lomo laboris fixie kogi, etsy disrupt aliquip pop-up pinterest odio adipisicing viral esse. </p>
                <p class="mgt-social">
                    <a href="#" class="social"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="social"><i class="fa fa-google-plus"></i></a>
                    <a href="#" class="social"><i class="fa fa-flickr"></i></a>
                    <a href="#" class="social"><i class="fa fa-youtube"></i></a>
                    <a href="#" class="social"><i class="fa fa-vimeo"></i></a>
                    <a href="#" class="social"><i class="fa fa-rss"></i></a>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="alignleft">
                <img src="img/Avatar-Manager-3.png" alt="Third Manager" class="avatar" />
            </div>
            <div class="mgt-details alignright">
                <h2>John Smith</h2>
                <h3>Chief Operational Officer</h3>
                <p>Pug letterpress ethnic craft beer pinterest, truffaut beard intelligentsia polaroid cred occupy artisan pickled. Sartorial selvage kogi, thundercats jean shorts echo park fap helvetica pork belly 3 wolf moon pop-up squid intelligentsia.  Lomo laboris fixie kogi, etsy disrupt aliquip pop-up pinterest odio adipisicing viral esse. </p>
                <p class="mgt-social">
                    <a href="#" class="social"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="social"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="social"><i class="fa fa-google-plus"></i></a>
                    <a href="#" class="social"><i class="fa fa-flickr"></i></a>
                    <a href="#" class="social"><i class="fa fa-youtube"></i></a>
                    <a href="#" class="social"><i class="fa fa-vimeo"></i></a>
                    <a href="#" class="social"><i class="fa fa-rss"></i></a>
                </p>
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
