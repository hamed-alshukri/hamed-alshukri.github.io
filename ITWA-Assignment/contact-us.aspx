<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="contact_us" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Contact Us - Oman United</title>
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
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="contact-us">
        <section id="content" class="boxed-container">
            <h3 class="no-margin-top">Please fill all fields in the form below</h3>
            <asp:Label ID="lbl_msg" runat="server" Text="" />
            <fieldset id="contact-form" class="no-border no-padding">
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="fname" runat="server" Placeholder="First Name" />
                        <asp:RequiredFieldValidator ID="req_fname" ControlToValidate="fname" runat="server" ErrorMessage="Please enter your first name" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_fname" runat="server" TargetControlID="req_fname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_fname" ControlToValidate="fname" runat="server" ErrorMessage="Only alphabets are allowed" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regfname" runat="server" TargetControlID="reg_fname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="lname" runat="server" Placeholder="Last Name" />
                        <asp:RequiredFieldValidator ID="req_lname" ControlToValidate="lname" runat="server" ErrorMessage="Please enter your last name" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_lname" runat="server" TargetControlID="req_lname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_lname" ControlToValidate="lname" runat="server" ErrorMessage="Only alphabets are allowed" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reglname" runat="server" TargetControlID="reg_lname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="email" runat="server" Placeholder="Email" />
                        <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter your email" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_email" runat="server" TargetControlID="req_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_email" ControlToValidate="email" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regemail" runat="server" TargetControlID="reg_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="subject" runat="server" Placeholder="Subject" />
                        <asp:RequiredFieldValidator ID="req_subject" ControlToValidate="subject" runat="server" ErrorMessage="Please enter a subject" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_subject" runat="server" TargetControlID="req_subject" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_subject" ControlToValidate="subject" runat="server" ErrorMessage="Numbers are not allowed alone in subject" ValidationExpression="^\d*[a-zA-Z ]{1,}\d*" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regsubject" runat="server" TargetControlID="reg_subject" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <asp:TextBox ID="message" runat="server" height="250px" Placeholder="Message" textmode="multiline"/>
                        <asp:RequiredFieldValidator ID="req_msg" ControlToValidate="message" runat="server" ErrorMessage="Please enter your message" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_msg" runat="server" TargetControlID="req_msg" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                </div>
                <div class="row">
                    <asp:Button ID="send" CssClass="plain-button" runat="server" Text="Send Message" OnClick="btnsend_click" />
                </div>
            </fieldset>
        </section>
        <aside id="sidebar">
            <div id="locaion-widget" class="boxed-container">
                <h3 class="widget-title">Our Location</h3>
                <p>AlKhuwair, Sultanate of Oman
                    <br />
                    Way 4515    Block 4541
                </p>
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d563162.318181945!2d58.589239646214196!3d23.306671599157895!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2som!4v1448605796969" class="map-frame no-border" width="250" height="200"></iframe>
            </div>
            <div id="contact-widget" class="boxed-container">
                <h3 class="widget-title">Get in Touch</h3>
                <p>
                    Tel: 24845486
                    <br />
                    Fax: 24846575
                </p>
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

